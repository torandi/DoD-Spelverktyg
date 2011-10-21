# -*- encoding: utf-8 -*-

module Dododr
  class Common
    def self.dice(value) 
      case value
        when 1
          '1T5'
        when 2
          '1T10'
        when 3
          '1T10(ÖP 10)'
        when 4
          '1T10(ÖP 9-10)'
        when 5
          '1T10(ÖP 8-10)'
        when 6
          '1T10(ÖP 8-10)+1'
      end
    end
  end
end
