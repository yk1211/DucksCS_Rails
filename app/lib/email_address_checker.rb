module EmailAddressChecker
  def well_formed_as_email(str)
    md = str.match(/^([^@]+)@([^@]+)$/)
    return false unless md
    local_part, stevens_part = md[1], md[2]
    return false unless well_formed_as_local(local_part)
    return false unless well_formed_as_stevens(stevens_part)
    return true
  end

  #     It is valid if email consists of following
  #     * alphanumeric
  #     * special characters like  ! # $ % & ' * + - / = ? ^ _ ` { | } ~
  #
  #     It is invalid if email
  #     * begin or end with dot(.)
  def well_formed_as_local(str)
    return false if str =~ %r"[^\w#!$%&'*+-\/=?^`{|}~]"
    return false if str =~ /^\./
    return false if str =~ /\.$/
    true
  end

  # Only valid if email consists of
  # stevens.edu
  def well_formed_as_stevens(str)
    if str =~ /stevens.edu/
      return true
    else
      return false
    end
  end

end
