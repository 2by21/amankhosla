class Post < ActiveRecord::Base

  # def surrounding
  #   if self.previous.nil?
  #     @prev_post = self
  #     @post = self.next
  #     @next_post = @post.next
  #   elsif self.next.nil?
  #     @next_post = self
  #     @post = self.previous
  #     @prev_post = @post.previous
  #   else
  #     @post = self
  #     @prev_post = @post.previous
  #     @next_post = @post.next
  #   end

  #   @first_date = @prev_post.created_at.strftime("%m/%y")
  #   @second_date = @post.created_at.strftime("%m/%y")
  #   @third_date = @next_post.created_at.strftime("%m/%y")

  #   return [@prev_post, @post, @next_post, @first_date, @second_date, @third_date]
  # end

  def as_json(options={})
    opts = {
      :methods => [:formatted_date]
    }

    super(options.merge(opts))
  end

  def formatted_date
    created_at.strftime("%m/%y")
  end
end
