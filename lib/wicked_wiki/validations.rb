module WickedWiki::Validations
  private
    def user_or_ip_present?
      errors[:base] << "Either ip or user_id need be present" if (user_id.nil? && ip.nil?)
    end
end