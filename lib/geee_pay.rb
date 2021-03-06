require 'digest/md5'

require "geee_pay/version"
require "geee_pay/engine"
require "geee_pay/utils/md5"
require "geee_pay/utils/http_post"
require "geee_pay/service"
require "geee_pay/result"
require "geee_pay/railtie" if defined?(Rails)

module GeeePay
  @client_params = {}
  @client_query_params = {}
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
  SERVICE_BALANCE_QUERY = 'QueryMerBalance.do'

  # 接口路径
  API_POST_NOTICE_URL = '/api/geee_pay/notify'

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

    def client_query_params
      params = {"merId" => @mer_id,
                "signType" => @sign_type}
      @client_query_params = params
      @client_query_params
    end

    def debug_mode?
      @debug_mode
    end
  end
end
