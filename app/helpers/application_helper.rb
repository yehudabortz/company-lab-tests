module ApplicationHelper

    def readable_timestamp(stamp)
        stamp ? stamp.strftime("%B %d, %Y at %l:%M %p") : "Please update birthday format."
    end

    def format_error(error)
        error.join(" ")
    end

    def input_with_errors_class(model, param)
        "input-box #{ 'red-warning' if model.errors["#{param}"].any?}"
    end
end
