require 'rubygems'
require 'net/ldap'

class BookController < ApplicationController
	
	host = "42.fr"
	port = "389"
	treebase = "dc=42, dc=fr"
	username = "jburet"
	pass = "public6542ENEMY"
	ldap = Net::LDAP.new	:host => host,
							:port => port,
							:base => treebase,
							:auth => {	:username => username,
										:password => pass,
										:method => :simple }	
	filter = Net::LDAP::Filter.eq("uidNumber", "4*")
	attrs = ["uid", "uidNumber", "ou", "birth-date", "mobile-phone"]
	ldap.search(:base => treebase, :filter => filter, :attributes => attrs, :return_result => false) do |entry|
		puts "DN = #{entry.dn}"
		entry.each do |attrib, val|
			puts "atrr : #{attrib}:"
			val.each do |value|
				puts "val : #{value}"
			end
		end
	end
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
  	@titre = "You're home."
  end
end
