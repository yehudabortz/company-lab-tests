module ApplicationHelper

    def readable_timestamp(stamp)
        stamp.strftime("%B %d, %Y at %l:%M %p")
    end
end
