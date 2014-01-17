module Jekyll
  module SplitContentFilter

    # Truncate blog entries so that only the part before the More Tag is 
    # displayed
    #
    # input - The String to be split.
    #
    # Examples
    #
    #   {{ "Hello <!--more--> world" | split_content }}
    #   # => 'Hello'
    #
    #   {{ "Hello <!--more But wait, there's more!--> world" | split_content }}
    #   # => 'Hello'
    #
    #   {{ "Hello world" | split_content }}
    #   # => 'Hello world.'
    #
    # Returns the truncated blog entry
    def split_content(input)
      re = %r{<!--more(?<read_more_message> ...*)?-->}
      m = input.match re
      
      if m.nil?
        # handles when a <!--more--> tag isn't present
        input
      else
        # handles just <!--more--> and <!--more Custom read more message!-->
        %|#{input.split(m[0]).first.strip}|
      end
    end

    # Truncate blog entries so that only the part before the More Tag is 
    # displayed, and a (custom) read more message pointing the reader to 
    # the full post shows up
    #
    # input - The String to be split.
    # url - The String to use as a link (<a href="...>)
    #
    # Examples
    #
    #   {{ "Hello <!--more--> world" | split_content_with_message: 'http://example.com' }}
    #   # => 'Hello<p><a href="http://example.com">Continue reading &rarr;</a></p>'
    #
    #   {{ "Hello <!--more But wait, there's more!--> world" | split_content_with_message: 'http://example.com' }}
    #   # => 'Hello<p><a href="http://example.com">But wait, there's more!</a></p>'
    #
    #   {{ "Hello world" | split_content_with_message: 'http://example.com' }}
    #   # => 'Hello world.'
    #
    # Returns the truncated blog entry and (custom) read more message
    def split_content_with_message(input, url)
      re = %r{<!--more(?<read_more_message> ...*)?-->}
      m = input.match re
      
      if m.nil?
        # handles when a <!--more--> tag isn't present
        input
      elsif m[:read_more_message].nil?
        # handles just <!--more-->
        %|#{input.split(m[0]).first.strip}<p><a href="#{url}">Continue reading &#8594;</a></p>|
      else
        # handles <!--more Custom read more message!-->
        %|#{input.split(m[0]).first.strip}<p><a href="#{url}">#{m[:read_more_message].strip}</a></p>|
      end
    end    
    
  end
end

Liquid::Template.register_filter(Jekyll::SplitContentFilter)
