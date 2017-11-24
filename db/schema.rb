# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171124163911) do

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tmp_usermeta_cheetah_export", primary_key: "umeta_id", id: :bigint, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["user_id", "meta_key"], name: "id_key", using: :btree
  end

  create_table "tmp_users_cheetah_export", primary_key: "ID", id: :bigint, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",           limit: 64,  default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key", limit: 60,  default: "", null: false
    t.integer  "user_status",                     default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
  end

  create_table "wprdm_babynamer", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ID",                                  null: false, unsigned: true
    t.string  "name",                                null: false
    t.string  "slug",                                null: false
    t.string  "gender",  limit: 1,     default: "m", null: false
    t.text    "meaning", limit: 65535,               null: false
    t.text    "origin",  limit: 65535,               null: false
    t.text    "similar", limit: 65535,               null: false
    t.index ["ID"], name: "ID", unique: true, using: :btree
    t.index ["gender"], name: "gender", using: :btree
    t.index ["name"], name: "name", unique: true, using: :btree
    t.index ["slug"], name: "slug", unique: true, using: :btree
  end

  create_table "wprdm_commentmeta", primary_key: "meta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "comment_id",                    default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["comment_id"], name: "comment_id", using: :btree
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
  end

  create_table "wprdm_comments", primary_key: "comment_ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "comment_post_ID",                    default: 0,   null: false, unsigned: true
    t.text     "comment_author",       limit: 255,                 null: false
    t.string   "comment_author_email", limit: 100,   default: "",  null: false
    t.string   "comment_author_url",   limit: 200,   default: "",  null: false
    t.string   "comment_author_IP",    limit: 100,   default: "",  null: false
    t.datetime "comment_date",                                     null: false
    t.datetime "comment_date_gmt",                                 null: false
    t.text     "comment_content",      limit: 65535,               null: false
    t.integer  "comment_karma",                      default: 0,   null: false
    t.string   "comment_approved",     limit: 20,    default: "1", null: false
    t.string   "comment_agent",                      default: "",  null: false
    t.string   "comment_type",         limit: 20,    default: "",  null: false
    t.bigint   "comment_parent",                     default: 0,   null: false, unsigned: true
    t.bigint   "user_id",                            default: 0,   null: false, unsigned: true
    t.index ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt", using: :btree
    t.index ["comment_author_email"], name: "comment_author_email", length: { comment_author_email: 10 }, using: :btree
    t.index ["comment_date_gmt"], name: "comment_date_gmt", using: :btree
    t.index ["comment_parent"], name: "comment_parent", using: :btree
    t.index ["comment_post_ID"], name: "comment_post_ID", using: :btree
  end

  create_table "wprdm_dossiers_articles", primary_key: ["wp_dossier_post_id", "drupal_article_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint  "wp_dossier_post_id",            default: 0,     null: false, unsigned: true
    t.bigint  "drupal_article_id",             default: 0,     null: false, unsigned: true
    t.string  "tag_dossier",        limit: 64,                 null: false
    t.boolean "processed",                     default: false, null: false
  end

  create_table "wprdm_drupal_author", primary_key: "drupalAuthorId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name", limit: 65535, null: false
  end

  create_table "wprdm_exporter_current_users", primary_key: "ID", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_email",           limit: 100,        null: false
    t.string "user_registered",      limit: 14,         null: false
    t.string "user_login",           limit: 60,         null: false
    t.text   "first_name",           limit: 4294967295, null: false
    t.text   "last_name",            limit: 4294967295, null: false
    t.string "dob",                  limit: 8,          null: false
    t.string "gender",               limit: 1,          null: false
    t.text   "postal_code",          limit: 4294967295, null: false
    t.string "perm_1_2",             limit: 1,          null: false
    t.text   "magazine_acct_number", limit: 4294967295, null: false
    t.string "user_url",             limit: 100,        null: false
    t.text   "facebook",             limit: 4294967295, null: false
    t.text   "twitter",              limit: 4294967295, null: false
    t.text   "linkedin",             limit: 4294967295, null: false
    t.text   "pinterest",            limit: 4294967295, null: false
    t.text   "address1",             limit: 4294967295, null: false
    t.text   "address2",             limit: 4294967295, null: false
    t.text   "home_phone",           limit: 4294967295, null: false
    t.text   "biz_phone",            limit: 4294967295, null: false
    t.text   "mobile_phone",         limit: 4294967295, null: false
    t.text   "city",                 limit: 4294967295, null: false
    t.text   "province",             limit: 4294967295, null: false
    t.text   "country",              limit: 4294967295, null: false
    t.string "privacy_flag",         limit: 1,          null: false
  end

  create_table "wprdm_exporter_exported_users", primary_key: "ID", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_email",           limit: 100,        null: false
    t.string "user_registered",      limit: 14,         null: false
    t.string "user_login",           limit: 60,         null: false
    t.text   "first_name",           limit: 4294967295, null: false
    t.text   "last_name",            limit: 4294967295, null: false
    t.string "dob",                  limit: 8,          null: false
    t.string "gender",               limit: 1,          null: false
    t.text   "postal_code",          limit: 4294967295, null: false
    t.string "perm_1_2",             limit: 1,          null: false
    t.text   "magazine_acct_number", limit: 4294967295, null: false
    t.string "user_url",             limit: 100,        null: false
    t.text   "facebook",             limit: 4294967295, null: false
    t.text   "twitter",              limit: 4294967295, null: false
    t.text   "linkedin",             limit: 4294967295, null: false
    t.text   "pinterest",            limit: 4294967295, null: false
    t.text   "address1",             limit: 4294967295, null: false
    t.text   "address2",             limit: 4294967295, null: false
    t.text   "home_phone",           limit: 4294967295, null: false
    t.text   "biz_phone",            limit: 4294967295, null: false
    t.text   "mobile_phone",         limit: 4294967295, null: false
    t.text   "city",                 limit: 4294967295, null: false
    t.text   "province",             limit: 4294967295, null: false
    t.text   "country",              limit: 4294967295, null: false
    t.string "privacy_flag",         limit: 1,          null: false
  end

  create_table "wprdm_failed_assets", primary_key: "asset_file", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "post_id", null: false, unsigned: true
  end

  create_table "wprdm_footables", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ID",                        null: false, unsigned: true
    t.string  "title",                     null: false
    t.binary  "fields", limit: 4294967295, null: false
    t.index ["ID"], name: "ID", unique: true, using: :btree
  end

  create_table "wprdm_imported_assets", primary_key: "asset_file", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "post_id", null: false, unsigned: true
  end

  create_table "wprdm_linked_images", primary_key: ["wp_post_id", "tops_image_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint  "wp_post_id",                      default: 0,     null: false, unsigned: true
    t.integer "tops_post_id",                    default: 0,     null: false, unsigned: true
    t.string  "tops_image_id",        limit: 64,                 null: false
    t.boolean "is_gallery",                      default: false, null: false
    t.integer "gallery_order",                   default: 0,     null: false, unsigned: true
    t.boolean "exclude_from_gallery",            default: false, null: false
    t.boolean "processed",                       default: false, null: false
    t.index ["is_gallery", "processed"], name: "idx_gallery_processed", using: :btree
  end

  create_table "wprdm_links", primary_key: "link_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "link_url",                          default: "",  null: false
    t.string   "link_name",                         default: "",  null: false
    t.string   "link_image",                        default: "",  null: false
    t.string   "link_target",      limit: 25,       default: "",  null: false
    t.string   "link_description",                  default: "",  null: false
    t.string   "link_visible",     limit: 20,       default: "Y", null: false
    t.bigint   "link_owner",                        default: 1,   null: false, unsigned: true
    t.integer  "link_rating",                       default: 0,   null: false
    t.datetime "link_updated",                                    null: false
    t.string   "link_rel",                          default: "",  null: false
    t.text     "link_notes",       limit: 16777215,               null: false
    t.string   "link_rss",                          default: "",  null: false
    t.index ["link_visible"], name: "link_visible", using: :btree
  end

  create_table "wprdm_mlp_galleries", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id",                       null: false
    t.string  "gallery_name",             null: false
    t.string  "gallery_type", limit: 100
    t.index ["id"], name: "id", unique: true, using: :btree
  end

  create_table "wprdm_mlp_images", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id",                                            null: false
    t.integer "gallery_id",                                    null: false
    t.integer "image_attachment_id",                           null: false
    t.string  "image_title",                                   null: false
    t.text    "image_description",   limit: 65535
    t.integer "image_order",                                   null: false
    t.integer "image_vote",                        default: 0, null: false
    t.string  "pair_title",                                    null: false
    t.text    "pair_description",    limit: 65535,             null: false
    t.index ["id"], name: "id", unique: true, using: :btree
  end

  create_table "wprdm_options", primary_key: "option_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "option_name",  limit: 191
    t.text   "option_value", limit: 4294967295,                 null: false
    t.string "autoload",     limit: 20,         default: "yes", null: false
    t.index ["option_name"], name: "option_name", unique: true, using: :btree
  end

  create_table "wprdm_pollsa", primary_key: "polla_aid", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "polla_qid",                 default: 0,  null: false
    t.string  "polla_answers", limit: 200, default: "", null: false
    t.integer "polla_votes",               default: 0,  null: false
  end

  create_table "wprdm_pollsip", primary_key: "pollip_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "pollip_qid",       limit: 10,  default: "",                    null: false
    t.string  "pollip_aid",       limit: 10,  default: "",                    null: false
    t.string  "pollip_ip",        limit: 100, default: "",                    null: false
    t.string  "pollip_host",      limit: 200, default: "",                    null: false
    t.string  "pollip_timestamp", limit: 20,  default: "0000-00-00 00:00:00", null: false
    t.text    "pollip_user",      limit: 255,                                 null: false
    t.integer "pollip_userid",                default: 0,                     null: false
    t.index ["pollip_id"], name: "pollip_ip", using: :btree
    t.index ["pollip_qid"], name: "pollip_qid", using: :btree
  end

  create_table "wprdm_pollsq", primary_key: "pollq_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "pollq_question",    limit: 200, default: "",   null: false
    t.string  "pollq_timestamp",   limit: 20,  default: "",   null: false
    t.integer "pollq_totalvotes",              default: 0,    null: false
    t.boolean "pollq_active",                  default: true, null: false
    t.string  "pollq_expiry",      limit: 20,  default: "",   null: false
    t.integer "pollq_multiple",    limit: 1,   default: 0,    null: false
    t.integer "pollq_totalvoters",             default: 0,    null: false
  end

  create_table "wprdm_postmeta", primary_key: "meta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "post_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["post_id"], name: "post_id", using: :btree
  end

  create_table "wprdm_posts", primary_key: "ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "post_author",                              default: 0,         null: false, unsigned: true
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",         limit: 20,         default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.bigint   "post_parent",                              default: 0,         null: false, unsigned: true
    t.string   "guid",                                     default: "",        null: false
    t.integer  "menu_order",                               default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.bigint   "comment_count",                            default: 0,         null: false
    t.index ["post_author"], name: "post_author", using: :btree
    t.index ["post_name"], name: "post_name", length: { post_name: 191 }, using: :btree
    t.index ["post_parent"], name: "post_parent", using: :btree
    t.index ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree
  end

  create_table "wprdm_rdm_ad_util_rules", primary_key: "R_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "R_taxonomy",  limit: 50,                  null: false
    t.bigint  "R_term_id",                               null: false
    t.string  "R_path",      limit: 150,                 null: false
    t.string  "R_zone_name", limit: 50,                  null: false
    t.text    "R_keywords",  limit: 65535,               null: false
    t.integer "R_order",                                 null: false
    t.string  "R_async",     limit: 1,     default: "1", null: false
  end

  create_table "wprdm_rdm_gallery", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "gallery_name",                           null: false
    t.string   "gallery_slug"
    t.text     "gallery_description", limit: 65535,      null: false
    t.text     "gallery_category",    limit: 65535,      null: false
    t.string   "gallery_orientation", limit: 32
    t.string   "background_colour",   limit: 7
    t.string   "use_ajax",            limit: 7
    t.string   "disable_scrolling",   limit: 7
    t.text     "slides",              limit: 65535
    t.text     "gallery_meta",        limit: 4294967295
    t.integer  "no_of_slides"
    t.string   "gallery_source",      limit: 32
    t.datetime "date_created",                           null: false
    t.datetime "date_modified",                          null: false
  end

  create_table "wprdm_rdm_most_popular_stats", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "post_id",                       null: false
    t.datetime "last_updated",                  null: false
    t.bigint   "total_pageviews",               null: false
    t.text     "pageviews_data",  limit: 65535, null: false
  end

  create_table "wprdm_rdm_nlc_newsletters", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id",                              null: false
    t.text    "posts",        limit: 65535,      null: false
    t.text    "ads",          limit: 65535,      null: false
    t.text    "images",       limit: 65535,      null: false
    t.integer "templates",                       null: false
    t.string  "date",                            null: false
    t.string  "title",                           null: false
    t.binary  "body",         limit: 4294967295, null: false
    t.string  "subject_line",                    null: false
    t.index ["id"], name: "id", unique: true, using: :btree
  end

  create_table "wprdm_rdm_nlc_templates", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id",                                         null: false
    t.string  "name",                                       null: false
    t.binary  "body",                    limit: 4294967295, null: false
    t.integer "no_posts",                                   null: false
    t.integer "no_ads",                                     null: false
    t.string  "allow_edit_titles",       limit: 3,          null: false
    t.string  "allow_edit_descriptions", limit: 3,          null: false
    t.text    "image_sizes",             limit: 65535,      null: false
    t.text    "ads_code",                limit: 65535,      null: false
    t.index ["id"], name: "id", unique: true, using: :btree
  end

  create_table "wprdm_rdm_recipes_plus_collections", primary_key: "gallery_id", id: :bigint, default: nil, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "hero_image_id",  null: false, unsigned: true
    t.string "hero_image_url", null: false
    t.string "button_text",    null: false
  end

  create_table "wprdm_rdm_recipes_plus_ingredients", primary_key: "term_id", id: :bigint, default: nil, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "plural",          limit: 200, null: false
    t.string "grocery_section", limit: 32,  null: false
    t.index ["plural"], name: "plural", using: :btree
  end

  create_table "wprdm_rdm_streams_streams", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "streams_name",         limit: 64,         null: false
    t.text   "streams_location",     limit: 4294967295, null: false
    t.text   "streams_posts",        limit: 4294967295, null: false
    t.text   "streams_custom_types", limit: 4294967295
  end

  create_table "wprdm_rdm_user_verification", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "user_id",                                                   null: false
    t.string   "username",                   limit: 60,                     null: false
    t.datetime "datetime_created",                                          null: false
    t.datetime "datetime_grace_period_ends",                                null: false
    t.datetime "datetime_finalized"
    t.string   "status",                     limit: 32, default: "pending", null: false
  end

  create_table "wprdm_redirection_404", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created",               null: false
    t.string   "url",      default: "", null: false
    t.string   "agent"
    t.string   "referrer"
    t.integer  "ip",                    null: false, unsigned: true
    t.index ["created"], name: "created", using: :btree
    t.index ["ip", "id"], name: "ip", using: :btree
    t.index ["referrer"], name: "referrer", using: :btree
    t.index ["url"], name: "url", using: :btree
  end

  create_table "wprdm_redirection_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",      limit: 50,                     null: false
    t.integer "tracking",             default: 1,         null: false
    t.integer "module_id",            default: 0,         null: false, unsigned: true
    t.string  "status",    limit: 8,  default: "enabled", null: false
    t.integer "position",             default: 0,         null: false, unsigned: true
    t.index ["module_id"], name: "module_id", using: :btree
    t.index ["status"], name: "status", using: :btree
  end

  create_table "wprdm_redirection_items", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",         limit: 16777215,                     null: false
    t.integer  "regex",                        default: 0,         null: false, unsigned: true
    t.integer  "position",                     default: 0,         null: false, unsigned: true
    t.integer  "last_count",                   default: 0,         null: false, unsigned: true
    t.datetime "last_access",                                      null: false
    t.integer  "group_id",                     default: 0,         null: false
    t.string   "status",      limit: 8,        default: "enabled", null: false
    t.string   "action_type", limit: 20,                           null: false
    t.integer  "action_code",                                      null: false, unsigned: true
    t.text     "action_data", limit: 16777215
    t.string   "match_type",  limit: 20,                           null: false
    t.string   "title",       limit: 50
    t.index ["group_id", "position"], name: "group_idpos", using: :btree
    t.index ["group_id"], name: "group", using: :btree
    t.index ["regex"], name: "regex", using: :btree
    t.index ["status"], name: "status", using: :btree
    t.index ["url"], name: "url", length: { url: 200 }, using: :btree
  end

  create_table "wprdm_redirection_logs", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created",                                      null: false
    t.text     "url",            limit: 16777215,              null: false
    t.text     "sent_to",        limit: 16777215
    t.text     "agent",          limit: 16777215,              null: false
    t.text     "referrer",       limit: 16777215
    t.integer  "redirection_id",                                            unsigned: true
    t.string   "ip",             limit: 17,       default: "", null: false
    t.integer  "module_id",                                    null: false, unsigned: true
    t.integer  "group_id",                                                  unsigned: true
    t.index ["created"], name: "created", using: :btree
    t.index ["group_id"], name: "group_id", using: :btree
    t.index ["ip"], name: "ip", using: :btree
    t.index ["module_id"], name: "module_id", using: :btree
    t.index ["redirection_id"], name: "redirection_id", using: :btree
  end

  create_table "wprdm_redirection_modules", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type",    limit: 20,       default: "", null: false
    t.string "name",    limit: 50,       default: "", null: false
    t.text   "options", limit: 16777215
    t.index ["name"], name: "name", using: :btree
    t.index ["type"], name: "type", using: :btree
  end

  create_table "wprdm_rg_form", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",        limit: 150,                 null: false
    t.datetime "date_created",                             null: false
    t.boolean  "is_active",                default: true,  null: false
    t.boolean  "is_trash",                 default: false, null: false
  end

  create_table "wprdm_rg_form_meta", primary_key: "form_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "display_meta",      limit: 4294967295
    t.text "entries_grid_meta", limit: 4294967295
    t.text "confirmations",     limit: 4294967295
    t.text "notifications",     limit: 4294967295
  end

  create_table "wprdm_rg_form_view", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "form_id",      limit: 3,              null: false, unsigned: true
    t.datetime "date_created",                        null: false
    t.string   "ip",           limit: 15
    t.integer  "count",        limit: 3,  default: 1, null: false, unsigned: true
    t.index ["form_id"], name: "form_id", using: :btree
  end

  create_table "wprdm_rg_incomplete_submissions", primary_key: "uuid", id: :string, limit: 32, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.integer  "form_id",      limit: 3,          null: false, unsigned: true
    t.datetime "date_created",                    null: false
    t.string   "ip",           limit: 39,         null: false
    t.text     "source_url",   limit: 4294967295, null: false
    t.text     "submission",   limit: 4294967295, null: false
    t.index ["form_id"], name: "form_id", using: :btree
  end

  create_table "wprdm_rg_lead", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "form_id",          limit: 3,                                               null: false, unsigned: true
    t.bigint   "post_id",                                                                               unsigned: true
    t.datetime "date_created",                                                             null: false
    t.boolean  "is_starred",                                            default: false,    null: false
    t.boolean  "is_read",                                               default: false,    null: false
    t.string   "ip",               limit: 39,                                              null: false
    t.string   "source_url",       limit: 200,                          default: "",       null: false
    t.string   "user_agent",       limit: 250,                          default: "",       null: false
    t.string   "currency",         limit: 5
    t.string   "payment_status",   limit: 15
    t.datetime "payment_date"
    t.decimal  "payment_amount",               precision: 19, scale: 2
    t.string   "payment_method",   limit: 30
    t.string   "transaction_id",   limit: 50
    t.boolean  "is_fulfilled"
    t.bigint   "created_by",                                                                            unsigned: true
    t.boolean  "transaction_type"
    t.string   "status",           limit: 20,                           default: "active", null: false
    t.index ["form_id"], name: "form_id", using: :btree
    t.index ["status"], name: "status", using: :btree
  end

  create_table "wprdm_rg_lead_detail", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "lead_id",                  null: false, unsigned: true
    t.integer "form_id",      limit: 3,   null: false, unsigned: true
    t.float   "field_number", limit: 24,  null: false
    t.string  "value",        limit: 200
    t.index ["form_id"], name: "form_id", using: :btree
    t.index ["lead_id", "field_number"], name: "lead_field_number", using: :btree
    t.index ["lead_id"], name: "lead_id", using: :btree
  end

  create_table "wprdm_rg_lead_detail_long", primary_key: "lead_detail_id", id: :bigint, default: nil, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "value", limit: 4294967295
  end

  create_table "wprdm_rg_lead_meta", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "form_id",    limit: 3,          default: 0, null: false, unsigned: true
    t.bigint  "lead_id",                                   null: false, unsigned: true
    t.string  "meta_key"
    t.text    "meta_value", limit: 4294967295
    t.index ["form_id", "meta_key"], name: "form_id_meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["lead_id"], name: "lead_id", using: :btree
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
  end

  create_table "wprdm_rg_lead_notes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "lead_id",                         null: false, unsigned: true
    t.string   "user_name",    limit: 250
    t.bigint   "user_id"
    t.datetime "date_created",                    null: false
    t.text     "value",        limit: 4294967295
    t.string   "note_type",    limit: 50
    t.index ["lead_id", "user_id"], name: "lead_user_key", using: :btree
    t.index ["lead_id"], name: "lead_id", using: :btree
  end

  create_table "wprdm_smush_dir_images", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "id",         limit: 3,     null: false
    t.text     "path",       limit: 65535, null: false
    t.string   "resize",     limit: 55
    t.string   "error",      limit: 55
    t.integer  "image_size",                            unsigned: true
    t.integer  "orig_size",                             unsigned: true
    t.integer  "file_time",                             unsigned: true
    t.datetime "last_scan",                null: false
    t.text     "meta",       limit: 65535
    t.string   "lossy",      limit: 55
    t.index ["id"], name: "id", unique: true, using: :btree
    t.index ["image_size"], name: "image_size", using: :btree
    t.index ["path"], name: "path", unique: true, length: { path: 191 }, using: :btree
  end

  create_table "wprdm_term_relationships", primary_key: ["object_id", "term_taxonomy_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint  "object_id",        default: 0, null: false, unsigned: true
    t.bigint  "term_taxonomy_id", default: 0, null: false, unsigned: true
    t.integer "term_order",       default: 0, null: false
    t.index ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree
  end

  create_table "wprdm_term_taxonomy", primary_key: "term_taxonomy_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "term_id",                        default: 0,  null: false, unsigned: true
    t.string "taxonomy",    limit: 32,         default: "", null: false
    t.text   "description", limit: 4294967295,              null: false
    t.bigint "parent",                         default: 0,  null: false, unsigned: true
    t.bigint "count",                          default: 0,  null: false
    t.index ["taxonomy"], name: "taxonomy", using: :btree
    t.index ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true, using: :btree
  end

  create_table "wprdm_termmeta", primary_key: "meta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "term_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["term_id"], name: "term_id", using: :btree
  end

  create_table "wprdm_terms", primary_key: "term_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name",       limit: 200, default: "", null: false
    t.string "slug",       limit: 200, default: "", null: false
    t.bigint "term_group",             default: 0,  null: false
    t.index ["name"], name: "name", length: { name: 191 }, using: :btree
    t.index ["slug"], name: "slug", length: { slug: 191 }, using: :btree
  end

  create_table "wprdm_tops_file_names", primary_key: ["tops_asset_id", "file_name"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tops_asset_id", default: "", null: false
    t.string "file_name",     default: "", null: false
  end

  create_table "wprdm_url_mapping", primary_key: "original_url", id: :string, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "wordpress_url", default: "", null: false
  end

  create_table "wprdm_usermeta", primary_key: "umeta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "wprdm_users", primary_key: "ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",                       default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key",             default: "", null: false
    t.integer  "user_status",                     default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
    t.index ["user_login"], name: "user_login_key", using: :btree
    t.index ["user_nicename"], name: "user_nicename", using: :btree
  end

end
