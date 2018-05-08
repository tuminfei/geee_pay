module GeeePay
  class NotifyController < ::ActionController::Base
    if _process_action_callbacks.any?{|a| a.filter == :verify_authenticity_token}
      # ActionController::Base no longer protects from forgery in Rails 5
      skip_before_filter :verify_authenticity_token
    end

    layout false

    def index
      notice = GeeePay::Notice.new
      notice.version_id = params[:versionId]
      notice.trans_type = params[:transType]
      notice.asyn_notify_url = params[:asynNotifyUrl]
      notice.syn_notify_url = params[:synNotifyUrl]
      notice.mer_id = params[:merId]
      notice.order_amount = params[:orderAmount]
      notice.prd_ord_no = params[:prdOrdNo]
      notice.order_status = params[:orderStatus]
      notice.pay_id = params[:payId]
      notice.pay_time = params[:payTime]
      notice.sign_type = params[:signType]
      notice.mer_param = params[:merParam]
      notice.sign_data = params[:signData]
      if notice.save
        render text: 'SUCCESS'
      else
        render text: 'FAIL'
      end
    end
  end
end
