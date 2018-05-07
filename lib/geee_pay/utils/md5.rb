require 'digest/md5'

module GeeePay
  module Utils
    class Md5
      # 生成md5签名
      def self.sign(params, key)
        # 删除空值

        # 排序
        data_hash = sorted_hash(params)
        # 拼接
        data_arr = []
        data_hash.each do |k,v|
          data_arr << "#{k.to_s}=#{v.to_s}"
        end
        data_arr << "key=#{key}"
        data_str = data_arr.join('&')
        return crypt_md5(data_str)
      end

      # 排序
      def self.sorted_hash(in_hash)
        return in_hash.sort{|a,b| a.to_s <=> b.to_s  }
      end

      def self.crypt_md5(msg, input_charset='utf-8')
        if input_charset ==  'utf-8'
          sign_msg =  msg
        else
          sign_msg =  msg.encode('utf-8', input_charset)
        end

        return Digest::MD5.hexdigest sign_msg
      end
    end
  end
end
