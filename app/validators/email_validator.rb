# taken from 
# http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/ 
# and modified a little; we don't want to send 'invalid email'
# message to the user when the email is empty; this should be
# caught by the presence validator and serviced with a more
# proper message (e.g. email cannot be empty); therefore, we're
# assuming that empty string is a valid mail. That's also not perfect,
# Todo: move this to upper level, eg. set that only one attribute 
# validator may fire at a time, and presence validator has higher 
# priority than email validator
# Tl;dr: ToDo: rewrite

require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    unless value.empty?
      begin
        m = Mail::Address.new(value)
        # We must check that value contains a domain and 
        # that value is an email address
        r = m.domain && m.address == value
        t = m.__send__(:tree)
        # We need to dig into treetop. A valid domain 
        # must have dot_atom_text elements size > 1
        # user@localhost is excluded
        # treetop must respond to domain
        # We exclude valid email values like <user@localhost.com>
        # Hence we use m.__send__(tree).domain
        r &&= (t.domain.dot_atom_text.elements.size > 1)
      rescue Exception => e   
        r = false
      end
      record.errors[attribute] << (options[:message] || "is invalid") unless r
    end
  end
end
