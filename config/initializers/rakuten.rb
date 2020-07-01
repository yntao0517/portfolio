RakutenWebService.configure do |c|
  #必須 アプリケーションID
  c.application_id = ENV['COID_APPLICATION_ID']
  #任意 楽天アフィリエイトID
  c.affiliate_id = ENV['COID_AFFILIATE_ID']

end