module ApplicationHelper
    def gravatar_for(user, options = { size: 80}) 
       gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
       size = options[:size]
       gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
       image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
end

# https://s.gravatar.com/avatar/b416039c480a28c2749eb8fb48c5e7b7?s=80
#   gravatar_url = "https://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"