

namespace :export do
  #export Article
  desc "Prints Article.all in a seeds.rb way."
  task :seeds_format => :environment do
    Article.order(:id).all.each do |article|
      puts "Article.create(#{article.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end

  #export User
  desc "Prints User.all in a seeds.rb way."
  task :seeds_format => :environment do
    User.order(:id).all.each do |user|
      puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end