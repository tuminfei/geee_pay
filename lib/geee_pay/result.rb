module GeeePay
  class Result
    attr_accessor :raw, :msg

    RESULT_SUCCESS_FLAG = '1'


    # 网关支付-银行编码
    BANK_CODE_MAP = {
        '102' => '工商银行',
        '103' => '农业银行',
        '104'	=> '中国银行',
        '105'	=> '建设银行',
        '203' => '农业发展银行',
        '301'	=> '交通银行',
        '302' => '中信银行',
        '303' => '光大银行',
        '304'	=> '华夏银行',
        '305' => '民生银行',
        '306'	=> '广发银行',
        '307'	=> '平安银行',
        '308'	=> '招商银行',
        '309'	=> '兴业银行',
        '310'	=> '浦发银行',
        '313'	=> '北京银行',
        '315' => '恒丰银行',
        '316' => '浙商银行',
        '318' => '渤海银行',
        '325' => '上海银行',
        '403' => '邮储银行',
        '440' => '徽商银行'
    }

    def initialize(result)
      self.raw = result.to_s
      self.msg = result
    end

    def success?
      @msg['returnCode'] == RESULT_SUCCESS_FLAG
    end
  end
end