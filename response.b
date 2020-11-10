   def nil?
      warn_about_nil_deprecation
      response.nil? || response.body.nil? || response.body.empty?
    end