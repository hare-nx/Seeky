class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!
  
  def reported_posts
    report_post_id=Report.where.not(post_id: nil).each {|p|  p.post_id}
    @posts=Post.where(id: report_post_id)
  end

  def reported_comments
    report_comment_id=Report.where.not(comment_id: nil).each {|c| c.comment_id}
    @comments=Comment.where(id: report_comment_id)
  end
end
