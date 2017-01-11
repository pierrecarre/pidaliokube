package main

import (
	"github.com/cedbossneo/pidalio/etcd"
	"github.com/cedbossneo/pidalio/ssl"
	"github.com/cedbossneo/pidalio/api"
	"os"
)

func main() {
	etcdClient := etcd.CreateEtcdClient([]string{os.Getenv("ETCD_URI")})
	rootCerts, serverCerts := ssl.LoadCerts(etcdClient, os.Getenv("TOKEN")[0:16])
	api.CreateAPIServer(rootCerts, serverCerts, etcdClient)
}
