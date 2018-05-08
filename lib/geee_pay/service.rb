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
        prd_ord_no, pay_mode, receivable_type, prd_amt, prd_name, prd_dis_url='', prd_short_name='', prd_desc='', mer_param='', options={})
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
      post_params = GeeePay.client_params.merge(options).merge(input_hash)
      #调用查询接口
      msg = GeeePay::Utils::HttpPost.send_post(service_name, post_params, GeeePay.mer_key)
      msg
    end

    # 提现申请
    # orderAmount 	订单金额
    # orderDate 	订单日期
    # currency 	货币类型]
    # asynNotifyUrl	异步通知 URL
    # prdOrdNo 	商户订单号
    # receivableType	到账类型
    # isCompay 	对公对私标识
    # phoneNo 	手机号
    # customerName	账户名
    # cerdType 	证件类型
    # cerdId 	证件号
    # accBankNo 	开户行号
    # accBankName 	开户行名称
    # acctNo 	银行账号
    # rcvBranchName	开户行联行名称
    # rcvBranchCode	开户行联行行号
    # outaccounttype	出账类型
    # bankBranch 	支行名称
    # provinceName	省份
    # cityname 	城市
    # note 	摘要
    def self.post_withdraw_apply(order_amount, order_date, currency, asyn_notify_url, prd_ord_no, pay_mode,
        receivable_type, is_compay, phone_no, customer_name, cerd_id, acc_bank_no, acc_bank_name, acct_no,
        rcv_branch_code, bank_branch, province_name, city_name,  cerd_type='', rcv_branch_name='', out_account_type='', note='', options={})
      service_name = GeeePay::SERVICE_WITHDRAW_APPLY
      input_hash = {"orderAmount" => order_amount,
                    "orderDate" => order_date,
                    "currency" => currency,
                    "asynNotifyUrl" => asyn_notify_url,
                    "prdOrdNo" => prd_ord_no,
                    "payMode" => pay_mode,
                    "receivableType" => receivable_type,
                    "isCompay" => is_compay,
                    "phoneNo" => phone_no,
                    "customerName" => customer_name,
                    "cerdId" => cerd_id,
                    "accBankNo" => acc_bank_no,
                    "accBankName" => acc_bank_name,
                    "acctNo" => acct_no,
                    "rcvBranchCode" => rcv_branch_code,
                    "bankBranch" => bank_branch,
                    "provinceName" => province_name,
                    "cityname" => city_name,
                    "cerdType" => cerd_type,
                    "rcvBranchName" => rcv_branch_name,
                    "outaccounttype" => out_account_type,
                    "note" => note}
      post_params = GeeePay.client_params.merge(options).merge(input_hash)
      #调用查询接口
      msg = GeeePay::Utils::HttpPost.send_post(service_name, post_params, GeeePay.mer_key)
      msg
    end

    # 网银支付申请
    # orderAmount 	订单金额
    # orderDate 	订单日期
    # currency 	货币类型
    # accountType 银行卡种类
    # asynNotifyUrl	异步通知 URL
    # synNotifyUrl	同步返回 URL
    # prdOrdNo 	商户订单号
    # payMode 	支付方式
    # tranChannel 银行编码
    # receivableType	到账类型
    # prdAmt 	商品价格
    # prdDisUrl 	商品展示网址
    # prdName 	商品名称
    # pnum 商品数量
    # prdShortName	商品简称
    # prdDesc 	商品描述
    # merParam 	扩展参数
    def self.post_pay_apply(order_amount, order_date, currency, account_type, asyn_notify_url, syn_notify_url, bank_card_no,
        prd_ord_no, pay_mode, tran_channel, receivable_type, prd_amt, prd_name, pnum, prd_dis_url='', prd_short_name='', prd_desc='', mer_param='', options={})
      service_name = GeeePay::SERVICE_PAY_APPLY
      input_hash = {"orderAmount" => order_amount,
                    "orderDate" => order_date,
                    "currency" => currency,
                    "accountType" => account_type,
                    "asynNotifyUrl" => asyn_notify_url,
                    "synNotifyUrl" => syn_notify_url,
                    "bankCardNo" => bank_card_no,
                    "prdOrdNo" => prd_ord_no,
                    "payMode" => pay_mode,
                    "tranChannel" => tran_channel,
                    "receivableType" => receivable_type,
                    "prdAmt" => prd_amt,
                    "prdName" => prd_name,
                    "pnum" => pnum,
                    "prdDisUrl" => prd_dis_url,
                    "prdShortName" => prd_short_name,
                    "prdDesc" => prd_desc,
                    "merParam" => mer_param}
      post_params = GeeePay.client_params.merge(options).merge(input_hash)
      # 调用查询接口
      msg, html_content = GeeePay::Utils::HttpPost.send_post(service_name, post_params, GeeePay.mer_key)
      # 网银支付接口接口竟然返回html, O !!! M !!! G !!!
      html_content
    end

    ########################查询类接口########################

    # 订单状态查询
    # prdOrdNo 商户订单号
    def self.query_order_status(prd_ord_No, options={})
      service_name = GeeePay::SERVICE_ORDER_QUERY
      input_hash = {"prdOrdNo" => prd_ord_No}
      post_params = GeeePay.client_query_params.merge(options).merge(input_hash)
      # 调用查询接口
      msg = GeeePay::Utils::HttpPost.send_post(service_name, post_params, GeeePay.mer_key)
      msg
    end

    # 帐户余额查询
    def self.query_mer_balance(options={})
      service_name = GeeePay::SERVICE_BALANCE_QUERY
      post_params = GeeePay.client_query_params.merge(options)
      #调用查询接口
      msg = GeeePay::Utils::HttpPost.send_post(service_name, post_params, GeeePay.mer_key)
      msg
    end

  end
end