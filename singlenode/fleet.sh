docker exec -it es01 openssl x509 -in /usr/share/elasticsearch/config/certs/ca/ca.crt -sha256 -fingerprint | grep SHA256 | sed 's/://g'

cat << EOS
ssl:
 certificate_authorities:
 - |
EOS
docker exec -it es01 cat /usr/share/elasticsearch/config/certs/ca/ca.crt | while read line; do
  echo "    ${line}"
done