class Admin::CommonController < ApplicationController
    layout 'admin'

    http_basic_authenticate_with name: "hos", password: "qweqwe"
end