module GeeePay
  class Service
    ########################交易类接口########################

    # 扫码支付申请
    # orderAmount 	订单金额
    # orderDate 	订单日期
    # currency 	货币类型
    # asynNotifyUrl	异步通知 URL
    # synNotifyUrl	同步返回 URL
    # prdOrdNo 	商户订单号
    # payMode 	支付方式
    # receivableType	到账类型
    # prdAmt 	商品价格
    # prdDisUrl 	商品展示网址
    # prdName 	商品名称
    # prdShortName	商品简称
    # prdDesc 	商品描述
    # merParam 	扩展参数

    def self.post_scan_pay_apply(order_amount, order_date, currency, asyn_notify_url, syn_notify_url,
        prd_ord_no, pay_mode, receivable_type, prd_amt, prd_name, prd_dis_url='', prd_short_name='', prd_desc='', mer_param='' options={})
      service_name = GeeePay::SERVICE_SCAN_PAY_APPLY
      input_hash = {"orderAmount" => order_amount,
                    "orderDate" => order_date,
                    "currency" => currency,
                    "asynNotifyUrl" => asyn_notify_url,
                    "synNotifyUrl" => syn_notify_url,
                    "prdOrdNo" => prd_ord_no,
                    "payMode" => pay_mode,
                    "receivableType" => receivable_type,
                    "prdAmt" => prd_amt,
                    "prdName" => prd_name,
                    "prdDisUrl" => prd_dis_url,
                    "prdShortName" => prd_short_name,
                    "prdDesc" => prd_desc,
                    "merParam" => mer_param}
      post_params = NeotelisPay.client_params.merge(options).merge(input_hash)
      #调用查询接口
      msg = GeeePay::Utils::HttpPost.send_post(service_name, post_params, GeeePay.mer_key)
      msg
    end

  end
end