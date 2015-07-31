# str = <<-EOS
# V30.0;Z-31,-95,100;
# Z-31,-95,100;
# V5.0;Z-31,-95,-1090;
# V5.0;Z-31,-95,-1170;
# V1.0;Z-31,-95,-1200;
# V5.0;
# EOS
#
# # V30.*?V5\.0.*?V5\.0.*?V1\.0.*?V5\.0
#
# if md = str.match(/V30.*?V5.*?V5.*?V1.*?V5.0;/m)
#     puts md[0] 
# else
#   puts 'no match'
# end

target_pattern = /V30.*?V5.*?V5.*?V1.*?V5.0;/m

rml = open('./test.rml','r').read
revised = rml.gsub(target_pattern,"")

fin = open('revised.rml','w')
fin.write(revised)
fin.close

