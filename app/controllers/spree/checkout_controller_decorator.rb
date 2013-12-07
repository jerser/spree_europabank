module Spree
  CheckoutController.class_eval do
    skip_before_filter :verify_authenticity_token,
                       :ensure_valid_state, :only => [:europabank_return]
    before_filter :europabank_hook, :only => [:update]

    def europabank_confirm
      @payment_method = @order.payments.last.payment_method

      ActiveMerchant::Billing::Base.integration_mode = @payment_method.
                                                          preferred(:server).to_sym

      @europabank = ActiveMerchant::Billing::Integrations::Europabank::Helper.new(
                      @order.number, @payment_method.preferred(:uid),
                      account_name: @payment_method.preferred(:beneficiary),
                      authcode: @payment_method.preferred(:client_secret))
      @europabank.amount = (@order.total * 100).to_i
      @europabank.return_url = europabank_return_order_checkout_url
      @europabank.customer name: "#{@order.bill_address.firstname} "\
                                 "#{@order.bill_address.lastname}",
                           language: I18n.locale
      @europabank.billing_address country: @order.bill_address.country.name
      @europabank.css = @payment_method.preferred(:css_url)
      @europabank.template = @payment_method.preferred(:template_url)
      @europabank_service_url = ActiveMerchant::Billing::Integrations::
                                  Europabank.service_url
    end

    def europabank_return
      @order = Order.find_by_number! params[:Orderid]

      payment_method =  @order.payments.last.payment_method

      return_handler = ActiveMerchant::Billing::Integrations::Europabank::
                        Return.new request.raw_post,
                                   authcode: payment_method.preferred(:client_secret)

      if return_handler.success?
        @order = Order.find_by_number! params[:Orderid]

        payment_method =  @order.payments.last.payment_method
        payment = @order.payments.create :amount => @order.total,
                                         :payment_method_id => payment_method.id
        payment.started_processing!
        payment.complete!

        @order.state = 'complete'
        @order.finalize!

        flash.notice = Spree.t(:order_processed_successfully)
        redirect_to completion_route
      else
        flash[:error] = Spree.t(:payment_has_been_cancelled)
        redirect_to edit_order_url(@order)
      end
    end

    private
    def europabank_hook
      return unless (params[:state] == 'payment')
      return unless params[:order][:payments_attributes]

      payment_method_id = PaymentMethod.find(
                params[:order][:payments_attributes].first[:payment_method_id])

      if payment_method_id.kind_of? BillingIntegration::Europabank
        @order.payments.create :amount => @order.total,
                               :payment_method_id => payment_method_id.id

        redirect_to europabank_confirm_order_checkout_url(@order,
                                                          :payment_method =>
                                                              payment_method_id)
      end
    end
  end
end
