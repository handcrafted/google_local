$:.unshift File.dirname(__FILE__)
 
require 'rubygems'
gem 'httparty', '0.4.3'
require 'httparty'
require 'mash'
require 'geokit'

require 'google_local/search'
require 'google_local/geocode'
require 'google_local/version'