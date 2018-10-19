module Sendgrid
  class Mail
    include JSON::Serializable

    struct Personalization
      include JSON::Serializable

      record To, email : String, name : String? = nil { include JSON::Serializable }
      record CC, email : String, name : String? = nil { include JSON::Serializable }
      record BCC, email : String, name : String? = nil { include JSON::Serializable }
    end

    record Personalization, to : Array(To), cc : Array(CC)? = nil, bcc : Array(BCC)? = nil, subject : String? = nil, headers : Hash(String, String)? = nil, substitutions : Hash(String, String)? = nil, custom_args : Hash(String, String)? = nil, send_at : Int64? = nil

    record From, email : String, name : String { include JSON::Serializable }
    record ReplyTo, email : String, name : String { include JSON::Serializable }
    record Content, type : String, value : String { include JSON::Serializable }
    record Attachment, content : String, filename : String, type : String? = nil, disposition : String? = nil, content_id : String? = nil { include JSON::Serializable }
    record ASM, group_id : Int32, groups_to_display : Array(Int32)? = nil { include JSON::Serializable }

    struct MailSettings
      include JSON::Serializable

      record BCC, enable : Bool? = nil, email : String? = nil { include JSON::Serializable }
      record BypassListManagement, enable : Bool? = nil { include JSON::Serializable }
      record Footer, enable : Bool? = nil, text : String? = nil, html : String? = nil { include JSON::Serializable }
      record SandboxMode, enable : Bool? = nil { include JSON::Serializable }
      record SpamCheck, enable : Bool? = nil, threshold : Int32? = nil, post_to_url : String? = nil { include JSON::Serializable }
    end

    record MailSettings, bcc : BCC? = nil, bypass_list_management : BypassListManagement? = nil, footer : Footer? = nil, sandbox_mode : SandboxMode? = nil, spam_check : SpamCheck? = nil

    struct TrackingSettings
      include JSON::Serializable

      record ClickTracking, enable : Bool? = nil, enable_text : Bool? = nil { include JSON::Serializable }
      record OpenTracking, enable : Bool? = nil, substitution_tag : String? = nil { include JSON::Serializable }
      record SubscriptionTracking, enable : Bool? = nil, text : String? = nil, html : String? = nil, substitution_tag : String? = nil { include JSON::Serializable }
      record Ganalytics, enable : Bool? = nil, utm_source : String? = nil, utm_medium : String? = nil, utm_term : String? = nil, utm_content : String? = nil, utm_campaign : String? = nil { include JSON::Serializable }
    end

    record TrackingSettings, click_tracking : ClickTracking? = nil, open_tracking : OpenTracking? = nil, subscription_tracking : SubscriptionTracking? = nil, ganalytics : Ganalytics? = nil

    def initialize(
      @personalizations : Array(Personalization),
      @from : From,
      @subject : String,
      @content : Array(Content),
      @reply_to : ReplyTo? = nil,
      @attachments : Array(Attachment)? = nil,
      @template_id : String? = nil,
      @sections : Hash(String, String)? = nil,
      @headers : Hash(String, String)? = nil,
      @categories : Array(String)? = nil,
      @custom_args : Hash(String, String)? = nil,
      @send_at : Int64? = nil,
      @batch_id : String? = nil,
      @asm : ASM? = nil,
      @ip_pool_name : String? = nil,
      @mail_settings : MailSettings? = nil,
      @tracking_settings : TrackingSettings? = nil
    )
    end
  end
end
