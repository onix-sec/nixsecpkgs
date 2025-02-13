{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "awrbacs";
  version = "7065a38";

  src = fetchFromGitHub {
    owner = "lobuhi";
    repo = "awrbacs";
    rev = "7065a388d7e4ba98101af37ad22931666cca9060";
    hash = "sha256-n2uAzYATej197kykqBinvqGPOqeRy5HwrPrO6PJYlh8=";
  };

  vendorHash = "sha256-oNfxnhim3/c0q090evG2aIOyh44oJn+7PfMk176AVMk=";

  meta = {
    description = "AWACS for RBAC, tool for auditing CRUD permissions in Kubernetes' RBAC";
    homepage = "https://github.com/lobuhi/awrbacs";
    # No license
  };
}
