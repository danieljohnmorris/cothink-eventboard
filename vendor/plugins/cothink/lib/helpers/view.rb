module Cothink
  module Helpers
    module View
      def truncate_first_sentence(str, max_chars, deliminator = nil)
        # match first sentence, defined as lots of none full stop characters
        /^
          ( 
            (?:
              [^\.] | # anything but a full stop, or...
              \.(?=\d) # full stop followed by a number, eg .1, to allow dates 12.10.2010, money £12.90
            )*
            (?:\.|!|\?) # followed by a full stop, exclamation or question mark
          )
        /x =~ str
        return $1 if $1.respond_to?(:length) && $1.length < max_chars
        truncate(str,max_chars,deliminator)
      end
    end
  end
end