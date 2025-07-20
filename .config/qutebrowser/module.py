from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI


def apply_config(config: ConfigAPI, c: ConfigContainer):
    config.load_autoconfig()

    c.aliases = {"w": "session-save", "q": "close", "qa": "quit", "wq": "quit --save"}

    c.auto_save.interval = 15000
    c.auto_save.session = True

    c.backend = "webengine"

    c.changelog_after_upgrade = "minor"

    c.colors.downloads.system.bg = "rgb"
    c.colors.downloads.system.fg = "rgb"
    c.colors.webpage.preferred_color_scheme = "dark"
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.darkmode.algorithm = "lightness-cielab"
    c.colors.webpage.darkmode.policy.images = "smart"
    c.colors.webpage.darkmode.policy.page = "smart"
    c.colors.completion.category.bg = (
        "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #888888, stop:1 #505050)"
    )

    c.completion.delay = 0
    c.completion.quick = True
    c.completion.show = "always"

    c.content.autoplay = True
    c.content.blocking.method = "both"
    c.content.blocking.hosts.block_subdomains = True
    c.content.cookies.store = True
    c.content.desktop_capture = "ask"
    c.content.geolocation = False
    c.content.headers.do_not_track = True
    c.content.headers.referer = "same-domain"
    c.content.hyperlink_auditing = False
    c.content.images = True
    c.content.javascript.enabled = True
    c.content.javascript.alert = True
    c.content.javascript.can_open_tabs_automatically = False
    c.content.javascript.clipboard = "ask"
    c.content.javascript.legacy_touch_events = "never"
    c.content.local_content_can_access_file_urls = True
    c.content.local_content_can_access_remote_urls = False
    c.content.local_storage = True
    c.content.media.audio_capture = "ask"
    c.content.media.audio_video_capture = "ask"
    c.content.media.video_capture = "ask"
    c.content.mouse_lock = "ask"
    c.content.mute = False
    c.content.notifications.enabled = "ask"
    c.content.notifications.presenter = "auto"
    c.content.notifications.show_origin = True
    c.content.pdfjs = False
    c.content.persistent_storage = "ask"
    c.content.plugins = False
    c.content.proxy = "system"
    c.content.webgl = True

    c.downloads.prevent_mixed_content = True
    c.downloads.remove_finished = -1

    c.editor.command = ["kitty", "-e", "nvim", "{file}"]
    c.editor.remove_file = True

    c.input.insert_mode.auto_enter = True
    c.input.insert_mode.auto_leave = True
    c.input.insert_mode.auto_load = False
    c.input.insert_mode.leave_on_load = True
    c.input.insert_mode.plugins = False
    c.input.media_keys = True

    c.prompt.filebrowser = True
