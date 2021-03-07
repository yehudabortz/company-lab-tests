module CompanyLabConnectionsHelper

    def pending_lab_connections
        # binding.pry
        current_lab.company_lab_connections.where(pending: true)
    end
end
