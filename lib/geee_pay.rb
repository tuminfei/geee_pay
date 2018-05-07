require 'digest/md5'
require 'uuid'

require "geee_pay/version"
require "geee_pay/utils/md5"
require "geee_pay/utils/http_post"
require "geee_pay/service"

module GeeePay
  @client_params = {}
  @client_options = {}
  @debug_mode = true
  @version = '1.0'
  @trans_type = '008'
  @input_charset = 'UTF-8'
  @sign_type = 'MD5'

  # 扫码支付申请-接口
  SERVICE_SCAN_PAY_APPLY = 'ScanPayApply.do'
  # 提现申请-接口
  SERVICE_WITHDRAW_APPLY = 'WithdrawApply.do'
  # 网银支付申请-接口
  SERVICE_PAY_APPLY = 'PayApply.do'
  # 订单状态查询-接口
  SERVICE_ORDER_QUERY = 'OrderStatusQuery.do'
  # 帐户余额查询-接口
  SERVICE_ORDER_QUERY = 'QueryMerBalance.do'

  class<< self
    # mer_id 商户账号
    # mer_key 加密key
    attr_accessor :mer_id, :mer_key, :debug_mode
    attr_reader :api_base_url

    def api_base_url=(url)
      @api_base_url = url
    end

    def client_params
      params = {"versionId" => @version,
                "merId" => @mer_id,
                "transType" => @trans_type,
                "signType" => @sign_type}
      @client_params = params
      @client_params
    end

    def debug_mode?
      @debug_mode
    end
  end
end
