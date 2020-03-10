project          = "galvanized-pipe-265913"
credentials_file = "/home/rasavo99/Project.json"
dns_zone_name    = "danjake"
dns_name         = "danjake.opensource-ukraine.org."
user_name        = "rasavo99"
p_key            = ".ssh/id_rsa"
vault_key        = "sxvova-pass.txt"
home_dir         = "/home/rasavo99"
static_ip = [
  {
    name   = "gitlab-ip",
    region = "europe-west1",
  },

  {
    name   = "jenkins-ip",
    region = "europe-west2",
  },

  {
    name   = "sentry-ip",
    region = "europe-west3",
  },

  {
    name   = "flask-ip",
    region = "europe-west6",
  },

  {
    name   = "ansible-ip",
    region = "europe-west4"
  }
]

dns_record = [
  {
    name = "tfgitlab",
  },

  {
    name = "tfjenkins",
  },

  {
    name = "tfsentry",
  },

  {
    name = "tfflask"
  }
]

default_disk = [
  {
    name = "gitlab-disk",
    zone = "europe-west1-b",
  },

  {
    name = "jenkins-disk",
    zone = "europe-west2-b",
  },

  {
    name = "sentry-disk",
    zone = "europe-west3-b",
  },

  {
    name = "flask-disk",
    zone = "europe-west6-b",
  },

  {
    name = "ansible-disk",
    zone = "europe-west4-b"
  }
]

instance = [
  {
    name = "terraform-gitlab",
    zone = "europe-west1-b",
  },
  {
    name = "terraform-jenkins",
    zone = "europe-west2-b",
  },
  {
    name = "terraform-sentry",
    zone = "europe-west3-b",
  },
  {
    name = "terraform-flask",
    zone = "europe-west6-b"
  }
]
