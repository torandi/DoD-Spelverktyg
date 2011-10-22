# -*- encoding: utf-8 -*-
module ApplicationHelper
  def output_value(output_type, value) 
    case output_type
      when :normal
        value
      when :dice
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
      when :turns
        "#{value} spelrundor"
      when :reach 
        if value == -1
          "Personlig"
        elsif value == 0
          "Beröring"
        else
          "#{value} meter"
        end
      when :time
        minutes = value
        if minutes >= 60
          hours = minutes/60
          minutes = minutes - hours*60
          if hours >= 24
            days = hours/24
            hours = hours - days*24
            if days > 365
              years = days/365
              days = days - years*365
            end

            if days > 30
              months = days/30 # Anse en månad som 30 dagar
              days = days - month*30
            end

            if days > 7
              weeks = days/7
              days = days - weeks*7
            end
          end
        end
        #output time!
        min = "#{minutes} minuter" if minutes > 0
        hrs = "#{hours} timmar" if hours> 0
        w = "#{weeks} veckor" if weeks > 0
        m = "#{months} månader" if months> 0
        y = "#{years} år" if years > 0
        res = "#{y}#{m}#{w}#{hrs}#{min}"
    end
  end

  def spell_type(type)
    case type
      when :instant
        "Ögonblicklig"
      when :sustained
        "Bevarande"
      when :lasting
        "Bestående"
      when :permanent
        "Permanent" 
    end
  end

  def link_to_remove_field(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.simple_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end
end
