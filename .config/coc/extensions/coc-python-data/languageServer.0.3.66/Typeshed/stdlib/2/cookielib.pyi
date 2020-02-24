from typing import Any

class Cookie:
    version = ...  # type: Any
    name = ...  # type: Any
    value = ...  # type: Any
    port = ...  # type: Any
    port_specified = ...  # type: Any
    domain = ...  # type: Any
    domain_specified = ...  # type: Any
    domain_initial_dot = ...  # type: Any
    path = ...  # type: Any
    path_specified = ...  # type: Any
    secure = ...  # type: Any
    expires = ...  # type: Any
    discard = ...  # type: Any
    comment = ...  # type: Any
    comment_url = ...  # type: Any
    rfc2109 = ...  # type: Any
    def __init__(self, version, name, value, port, port_specified, domain, domain_specified, domain_initial_dot, path, path_specified, secure, expires, discard, comment, comment_url, rest, rfc2109=False): ...
    def has_nonstandard_attr(self, name): ...
    def get_nonstandard_attr(self, name, default=None): ...
    def set_nonstandard_attr(self, name, value): ...
    def is_expired(self, now=None): ...

class CookiePolicy:
    def set_ok(self, cookie, request): ...
    def return_ok(self, cookie, request): ...
    def domain_return_ok(self, domain, request): ...
    def path_return_ok(self, path, request): ...

class DefaultCookiePolicy(CookiePolicy):
    DomainStrictNoDots = ...  # type: Any
    DomainStrictNonDomain = ...  # type: Any
    DomainRFC2965Match = ...  # type: Any
    DomainLiberal = ...  # type: Any
    DomainStrict = ...  # type: Any
    netscape = ...  # type: Any
    rfc2965 = ...  # type: Any
    rfc2109_as_netscape = ...  # type: Any
    hide_cookie2 = ...  # type: Any
    strict_domain = ...  # type: Any
    strict_rfc2965_unverifiable = ...  # type: Any
    strict_ns_unverifiable = ...  # type: Any
    strict_ns_domain = ...  # type: Any
    strict_ns_set_initial_dollar = ...  # type: Any
    strict_ns_set_path = ...  # type: Any
    def __init__(self, blocked_domains=None, allowed_domains=None, netscape=True, rfc2965=False, rfc2109_as_netscape=None, hide_cookie2=False, strict_domain=False, strict_rfc2965_unverifiable=True, strict_ns_unverifiable=False, strict_ns_domain=..., strict_ns_set_initial_dollar=False, strict_ns_set_path=False): ...
    def blocked_domains(self): ...
    def set_blocked_domains(self, blocked_domains): ...
    def is_blocked(self, domain): ...
    def allowed_domains(self): ...
    def set_allowed_domains(self, allowed_domains): ...
    def is_not_allowed(self, domain): ...
    def set_ok(self, cookie, request): ...
    def set_ok_version(self, cookie, request): ...
    def set_ok_verifiability(self, cookie, request): ...
    def set_ok_name(self, cookie, request): ...
    def set_ok_path(self, cookie, request): ...
    def set_ok_domain(self, cookie, request): ...
    def set_ok_port(self, cookie, request): ...
    def return_ok(self, cookie, request): ...
    def return_ok_version(self, cookie, request): ...
    def return_ok_verifiability(self, cookie, request): ...
    def return_ok_secure(self, cookie, request): ...
    def return_ok_expires(self, cookie, request): ...
    def return_ok_port(self, cookie, request): ...
    def return_ok_domain(self, cookie, request): ...
    def domain_return_ok(self, domain, request): ...
    def path_return_ok(self, path, request): ...

class Absent: ...

class CookieJar:
    non_word_re = ...  # type: Any
    quote_re = ...  # type: Any
    strict_domain_re = ...  # type: Any
    domain_re = ...  # type: Any
    dots_re = ...  # type: Any
    magic_re = ...  # type: Any
    def __init__(self, policy=None): ...
    def set_policy(self, policy): ...
    def add_cookie_header(self, request): ...
    def make_cookies(self, response, request): ...
    def set_cookie_if_ok(self, cookie, request): ...
    def set_cookie(self, cookie): ...
    def extract_cookies(self, response, request): ...
    def clear(self, domain=None, path=None, name=None): ...
    def clear_session_cookies(self): ...
    def clear_expired_cookies(self): ...
    def __iter__(self): ...
    def __len__(self): ...

class LoadError(IOError): ...

class FileCookieJar(CookieJar):
    filename = ...  # type: Any
    delayload = ...  # type: Any
    def __init__(self, filename=None, delayload=False, policy=None): ...
    def save(self, filename=None, ignore_discard=False, ignore_expires=False): ...
    def load(self, filename=None, ignore_discard=False, ignore_expires=False): ...
    def revert(self, filename=None, ignore_discard=False, ignore_expires=False): ...

MozillaCookieJar = FileCookieJar
LWPCookieJar = FileCookieJar
def lwp_cookie_str(cookie: Cookie) -> str: ...
