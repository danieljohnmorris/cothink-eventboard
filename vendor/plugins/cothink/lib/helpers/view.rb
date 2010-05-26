module Cothink
  module Helpers
    module View
      def truncate_first_sentence(str, max_chars, deliminator = nil)
        # match first sentence
        /^([^\.]*\.)/ =~ str
        return $1 if $1.respond_to?(:length) && $1.length < max_chars
        truncate(str,max_chars,deliminator)
      end
    end
  end
end