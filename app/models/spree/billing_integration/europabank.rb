class Spree::BillingIntegration::Europabank < Spree::BillingIntegration
  preference :uid, :string                   # Uid
  preference :beneficiary, :string           # Beneficiary
  preference :client_secret, :string         # Client Secret

  preference :css_url, :string               # Custom CSS for MPI Page
  preference :template_url, :string          # Custom HTML Template for MPI Page

  def provider_class
    ActiveMerchant::Billing::Integrations::Europabank
  end
end

