# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 38) do

  create_table "access_logs", :force => true do |t|
    t.column "ip",                 :string
    t.column "request",            :text
    t.column "referrer",           :text
    t.column "user_agent",         :string
    t.column "language",           :string
    t.column "host",               :string
    t.column "created_at",         :datetime
    t.column "public_homebase_id", :integer
    t.column "message_id",         :integer
    t.column "project_id",         :integer
    t.column "resource_id",        :integer
    t.column "homebase_id",        :integer
  end

  create_table "addresses", :force => true do |t|
    t.column "homebase_id",  :integer,                :null => false
    t.column "created_by",   :integer
    t.column "email",        :string,                 :null => false
    t.column "name",         :string
    t.column "organization", :string
    t.column "address1",     :string
    t.column "address2",     :string
    t.column "city",         :string
    t.column "state",        :string,   :limit => 50
    t.column "postal",       :string,   :limit => 20
    t.column "country",      :string
    t.column "time_zone",    :string
    t.column "phone",        :string,   :limit => 20
    t.column "website",      :string
    t.column "created_at",   :datetime
    t.column "updated_at",   :datetime
    t.column "updated_by",   :integer
    t.column "position",     :integer
  end

  add_index "addresses", ["homebase_id", "email"], :name => "addresses_unique_homebase_and_email", :unique => true

  create_table "addresses_groups", :id => false, :force => true do |t|
    t.column "address_id", :integer
    t.column "group_id",   :integer
    t.column "created_at", :datetime
  end

  add_index "addresses_groups", ["address_id", "group_id"], :name => "unique_addresses_groups", :unique => true

  create_table "addresses_messages", :id => false, :force => true do |t|
    t.column "address_id", :integer
    t.column "message_id", :integer
  end

  create_table "addresses_projects", :id => false, :force => true do |t|
    t.column "address_id", :integer
    t.column "project_id", :integer
  end

  create_table "addresses_resources", :id => false, :force => true do |t|
    t.column "address_id",  :integer
    t.column "resource_id", :integer
  end

  create_table "alerts", :force => true do |t|
    t.column "title",            :string
    t.column "description",      :text
    t.column "description_html", :text
    t.column "created_at",       :datetime
    t.column "expires_at",       :datetime
  end

  create_table "comments", :force => true do |t|
    t.column "message_id", :integer
    t.column "name",       :string
    t.column "email",      :string
    t.column "url",        :string
    t.column "ip",         :string,   :limit => 15
    t.column "body",       :text
    t.column "body_html",  :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "updated_by", :integer
    t.column "user_agent", :string
    t.column "referer",    :string
  end

  create_table "countries", :force => true do |t|
    t.column "code", :string, :limit => 50
    t.column "name", :string
  end

  create_table "emails", :force => true do |t|
    t.column "from",    :string
    t.column "to",      :string
    t.column "cc",      :string
    t.column "bcc",     :string
    t.column "charset", :string
    t.column "headers", :string
    t.column "subject", :text
    t.column "body",    :text
    t.column "raw",     :text
  end

  create_table "events", :force => true do |t|
    t.column "project_id",    :integer,                :null => false
    t.column "name",          :string
    t.column "start_date",    :datetime
    t.column "end_date",      :datetime
    t.column "body",          :text
    t.column "body_html",     :text
    t.column "created_at",    :datetime
    t.column "updated_at",    :datetime
    t.column "updated_by",    :integer
    t.column "duration_unit", :string,   :limit => 25
    t.column "duration_n",    :integer
  end

  create_table "groups", :force => true do |t|
    t.column "homebase_id", :integer, :null => false
    t.column "created_by",  :integer
    t.column "name",        :string,  :null => false
    t.column "position",    :integer
  end

  add_index "groups", ["homebase_id", "name"], :name => "groups_unique_homebase_and_name", :unique => true

  create_table "groups_messages", :id => false, :force => true do |t|
    t.column "group_id",   :integer
    t.column "message_id", :integer
  end

  create_table "groups_projects", :id => false, :force => true do |t|
    t.column "group_id",   :integer
    t.column "project_id", :integer
  end

  create_table "groups_resources", :id => false, :force => true do |t|
    t.column "group_id",    :integer
    t.column "resource_id", :integer
  end

  create_table "homebases", :force => true do |t|
    t.column "subscription_plan_id", :integer,                :default => 1
    t.column "subdomain",            :string,                                :null => false
    t.column "name",                 :string,                                :null => false
    t.column "tagline",              :string
    t.column "profile",              :text
    t.column "address1",             :string
    t.column "address2",             :string
    t.column "city",                 :string
    t.column "state",                :string,   :limit => 50
    t.column "postal",               :string,   :limit => 20
    t.column "country",              :string
    t.column "time_zone",            :string
    t.column "phone",                :string,   :limit => 20
    t.column "website",              :string
    t.column "display_contact_info", :integer,                :default => 0
    t.column "created_at",           :datetime
    t.column "updated_at",           :datetime
    t.column "deleted",              :integer
    t.column "deleted_at",           :datetime
    t.column "created_by",           :integer
    t.column "messages_count",       :integer,                :default => 0
    t.column "projects_count",       :integer,                :default => 0
    t.column "resources_count",      :integer,                :default => 0
    t.column "addresses_count",      :integer,                :default => 0
    t.column "groups_count",         :integer,                :default => 0
    t.column "access_logs_count",    :integer,                :default => 0
    t.column "logo",                 :string
    t.column "profile_extended",     :text
    t.column "free_trial",           :integer
  end

  add_index "homebases", ["subdomain"], :name => "homebases_subdomain_key", :unique => true

  create_table "invitations", :force => true do |t|
    t.column "first_name",      :string
    t.column "last_name",       :string
    t.column "invitation_code", :string
    t.column "created_at",      :datetime
    t.column "used_at",         :datetime
    t.column "use_counter",     :integer,  :default => 0
  end

  create_table "invoice_items", :force => true do |t|
    t.column "invoice_id",  :integer
    t.column "price",       :integer, :default => 0, :null => false
    t.column "period",      :string
    t.column "quantity",    :integer
    t.column "comment",     :text
    t.column "name",        :string
    t.column "description", :text
  end

  create_table "invoices", :force => true do |t|
    t.column "subscription_id",   :integer
    t.column "total",             :integer,  :default => 0, :null => false
    t.column "created_at",        :datetime
    t.column "comment",           :text
    t.column "billing_name",      :string
    t.column "billing_address",   :string
    t.column "billing_city",      :string
    t.column "billing_state",     :string
    t.column "billing_zip",       :string
    t.column "billing_country",   :string
    t.column "payment_last_four", :string
    t.column "snapshot",          :text
    t.column "billing_date",      :datetime
    t.column "period_start",      :datetime
    t.column "period_end",        :datetime
    t.column "payment_method",    :string
    t.column "pending",           :integer
  end

  create_table "messages", :force => true do |t|
    t.column "homebase_id",       :integer,                 :null => false
    t.column "created_by",        :integer
    t.column "project_id",        :integer
    t.column "subject",           :string
    t.column "body",              :text
    t.column "body_html",         :text
    t.column "keywords",          :string
    t.column "private",           :integer,  :default => 0
    t.column "disable_comments",  :integer,  :default => 0
    t.column "draft",             :integer,  :default => 0
    t.column "created_at",        :datetime
    t.column "updated_at",        :datetime
    t.column "updated_by",        :integer
    t.column "comments_count",    :integer,  :default => 0
    t.column "access_logs_count", :integer,  :default => 0
    t.column "extended",          :text
    t.column "extended_html",     :text
    t.column "permalink",         :string
    t.column "salted_password",   :string
    t.column "salt",              :string
  end

  add_index "messages", ["permalink"], :name => "messages_permalink_index"

  create_table "messages_projects", :id => false, :force => true do |t|
    t.column "message_id", :integer
    t.column "project_id", :integer
  end

  create_table "messages_resources", :id => false, :force => true do |t|
    t.column "message_id",  :integer
    t.column "resource_id", :integer
  end

  create_table "pages", :force => true do |t|
    t.column "title",      :string
    t.column "permalink",  :string
    t.column "author",     :string
    t.column "body",       :text
    t.column "body_html",  :text
    t.column "excerpt",    :text
    t.column "keywords",   :string
    t.column "draft",      :integer,  :default => 0
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "deleted",    :integer
    t.column "deleted_at", :datetime
  end

  create_table "projects", :force => true do |t|
    t.column "homebase_id",       :integer,                 :null => false
    t.column "created_by",        :integer
    t.column "name",              :string
    t.column "description",       :text
    t.column "description_html",  :text
    t.column "country",           :string
    t.column "state",             :string
    t.column "city",              :string
    t.column "created_at",        :datetime
    t.column "updated_at",        :datetime
    t.column "updated_by",        :integer
    t.column "private",           :integer,  :default => 0
    t.column "archived",          :integer,  :default => 0
    t.column "messages_count",    :integer,  :default => 0
    t.column "events_count",      :integer,  :default => 0
    t.column "access_logs_count", :integer,  :default => 0
    t.column "first_event",       :datetime
    t.column "permalink",         :string
    t.column "salted_password",   :string
    t.column "salt",              :string
    t.column "resources_count",   :integer,  :default => 0
    t.column "excerpt",           :text
    t.column "excerpt_html",      :text
  end

  add_index "projects", ["permalink"], :name => "projects_permalink_index"

  create_table "projects_resources", :id => false, :force => true do |t|
    t.column "resource_id", :integer
    t.column "project_id",  :integer
  end

  create_table "resources", :force => true do |t|
    t.column "homebase_id",       :integer,                               :null => false
    t.column "created_by",        :integer
    t.column "name",              :string
    t.column "file",              :string
    t.column "description",       :text
    t.column "content_type",      :string
    t.column "size",              :integer
    t.column "data",              :binary
    t.column "created_at",        :datetime
    t.column "updated_at",        :datetime
    t.column "updated_by",        :integer
    t.column "private",           :integer,                :default => 0
    t.column "access_logs_count", :integer,                :default => 0
    t.column "type",              :string,   :limit => 20
    t.column "permalink",         :string
    t.column "salted_password",   :string
    t.column "salt",              :string
    t.column "project_id",        :integer
  end

  add_index "resources", ["permalink"], :name => "resources_permalink_index"

  create_table "screenshots", :force => true do |t|
    t.column "name",        :string
    t.column "caption",     :string
    t.column "description", :string
    t.column "thumbnail",   :string
    t.column "image",       :string
    t.column "movie",       :string
    t.column "created_at",  :string
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "sessions_session_id_index"

  create_table "subscription_plan_items", :id => false, :force => true do |t|
    t.column "subscription_plan_id",           :integer
    t.column "subscription_plan_privelege_id", :integer
    t.column "plan_limit",                     :integer, :default => 0
  end

  create_table "subscription_plan_priveleges", :force => true do |t|
    t.column "name", :string
  end

  create_table "subscription_plans", :force => true do |t|
    t.column "name",        :string
    t.column "price",       :integer, :default => 0, :null => false
    t.column "description", :text
    t.column "visible",     :integer, :default => 1, :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.column "homebase_id",          :integer
    t.column "created_at",           :datetime
    t.column "updated_at",           :datetime
    t.column "last_action",          :string
    t.column "installments",         :integer
    t.column "start_date",           :datetime
    t.column "periodicity",          :string
    t.column "comments",             :text
    t.column "identifier",           :string
    t.column "name",                 :string
    t.column "email",                :string
    t.column "address",              :string
    t.column "address2",             :string
    t.column "city",                 :string
    t.column "state",                :string
    t.column "zip",                  :string
    t.column "country",              :string
    t.column "subscription_plan_id", :integer
    t.column "last_four",            :string
    t.column "card_type",            :string
    t.column "price",                :integer
    t.column "trial_ends_at",        :datetime
    t.column "coupon_code",          :string
    t.column "pending",              :integer
    t.column "salt",                 :string
    t.column "last_billing_date",    :datetime
    t.column "old_identifiers",      :text
  end

  create_table "tags", :force => true do |t|
    t.column "name", :string
  end

  create_table "tags_messages", :id => false, :force => true do |t|
    t.column "tag_id",     :integer
    t.column "message_id", :integer
  end

  create_table "tags_projects", :id => false, :force => true do |t|
    t.column "tag_id",     :integer
    t.column "project_id", :integer
  end

  create_table "tags_resources", :id => false, :force => true do |t|
    t.column "tag_id",      :integer
    t.column "resource_id", :integer
  end

  create_table "users", :force => true do |t|
    t.column "homebase_id",        :integer
    t.column "type",               :string,   :limit => 20
    t.column "created_by",         :integer
    t.column "username",           :string
    t.column "email",              :string
    t.column "salt",               :string,   :limit => 40
    t.column "salted_password",    :string
    t.column "address1",           :string
    t.column "address2",           :string
    t.column "city",               :string
    t.column "state",              :string,   :limit => 50
    t.column "postal",             :string,   :limit => 20
    t.column "country",            :string
    t.column "time_zone",          :string
    t.column "phone",              :string,   :limit => 20
    t.column "website",            :string
    t.column "created_at",         :datetime
    t.column "updated_at",         :datetime
    t.column "logged_in_at",       :datetime
    t.column "login_counter",      :integer,                 :default => 0
    t.column "verified",           :integer,                 :default => 0
    t.column "security_token",     :string,   :limit => 40
    t.column "token_expiry",       :datetime
    t.column "deleted",            :integer,                 :default => 0
    t.column "deleted_at",         :datetime
    t.column "can_edit_messages",  :integer,                 :default => 1
    t.column "can_edit_projects",  :integer,                 :default => 1
    t.column "can_edit_addresses", :integer,                 :default => 1
    t.column "can_edit_files",     :integer,                 :default => 1
    t.column "name",               :string,   :limit => 500
    t.column "can_edit_leaders",   :integer,                 :default => 1
  end

  add_index "users", ["homebase_id", "email"], :name => "users_unique_homebase_and_email", :unique => true
  add_index "users", ["homebase_id", "username"], :name => "users_unique_homebase_and_username", :unique => true

end
