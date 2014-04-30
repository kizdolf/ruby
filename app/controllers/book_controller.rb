	# filter = Net::LDAP::Filter.eq("uidNumber", "*")
	# attrs = ["uid", "uidNumber", "ou", "birth-date", "mobile-phone"]
	# ldap.search(:base => treebase, :filter => filter, :attributes => attrs, :return_result => false) do |entry|
	# 	@ld  = "DN = #{entry.dn}"
	# 	entry.each do |attrib, val|
	# 		@ldap  += "atrr : #{attrib}:"
	# 		val.each do |value|
	# 			@ldap  += "val : #{value}"
	# 		end
	# 	end
	# endrequire 'rubygems'



class BookController < ApplicationController
	before_action :authenticate_book!
	
	require 'auth_42'
  
  def login
  	@titre = "login"
  end

  def admin
  	@titre = "You're The Boss"
  end

  def logueur
  	@titre = "Big mother"
  end

  def consult
  	book_signed_in?
  	current_book
  	@titre = "Are you talking to me?"
  end

  def index
	book_signed_in?
  	current_book
  	book_session
  	auth = Auth42::SimpleAuth

  	if auth.authenticate('jburet', 'public6542ENEMY')
  		@ldap = "SUCESS"
  	else
  		@ldap = "FAIL"
  	end
  	@titre = "You're home."
  end
end
