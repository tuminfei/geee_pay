require 'logger'

module GeeePay
  module Utils
    class HttpPost

      DEFAULT_ERR_MSG = '{"code":"0","desc":"其他错误！"}'

      #发送请求
      def self.send_post(service_type, query_params, key)
        api_url = "#{GeeePay.api_base_url}/#{service_type}"
        # 对参数就行排序并签名
        sign_data, sign_str = GeeePay::Utils::Md5.sign(query_params, key)

        # 加签名的查询参数
        func_params = {"signData" => sign_data}

        func_all_params = query_params.merge(func_params)
        conn = Faraday.new(:url => api_url)

        # 设置超时时间
        conn.options.timeout = 20

        response = conn.post '', func_all_params
        html_response = response.body
        html_content = ''

        if GeeePay.debug_mode
          log_file = File.join(Rails.root, "log", "geee_pay.log")
          logger = Logger.new(log_file)
          logger.info('--------------GEEE PAY DEBUG--------------')
          logger.info("URL:#{api_url.to_s}")
          logger.info("PARAMS:#{func_all_params.to_s}")
          logger.info("SIGN_STR:#{sign_str}")
          logger.info("SIGN_DATA:#{sign_data}")
          logger.info("RESPONSE:#{html_response.force_encoding('UTF-8')}")
        end

        begin
          msg = JSON.parse(html_response)
        rescue JSON::ParserError => e
          html_content = html_response
          msg = JSON.parse(DEFAULT_ERR_MSG)
        end
        return msg, html_content
      end
    end
  end
end
