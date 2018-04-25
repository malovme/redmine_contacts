module RedmineContacts
  module Patches
    module ProjectPatch
      def self.included(base)
        base.class_eval do
          has_many :contacts, :dependent => :delete_all
        end
      end
    end
  end
end

unless Project.included_modules.include?(RedmineContacts::Patches::ProjectPatch)
  Project.send(:include, RedmineContacts::Patches::ProjectPatch)
end
