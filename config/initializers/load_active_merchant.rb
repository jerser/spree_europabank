require 'active_merchant/billing/integrations/europabank'
require 'active_merchant/billing/integrations/europabank/helper'
require 'active_merchant/billing/integrations/europabank/notification'
require 'active_merchant/billing/integrations/europabank/return'

require 'active_merchant/billing/integrations/action_view_helper'
ActionView::Base.send :include,
                       ActiveMerchant::Billing::Integrations::ActionViewHelper
