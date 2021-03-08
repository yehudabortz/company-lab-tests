module ApplicationHelper

    def readable_timestamp(stamp)
        stamp.strftime("%B %d, %Y at %l:%M %p")
    end

    def format_error(error)
        error.join(" ")
    end

    def input_with_errors_class(model, param)
        "input #{ 'is-danger' if model.errors["#{param}"].any?}"
    end
end
