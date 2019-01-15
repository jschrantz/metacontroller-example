from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import json

class Controller(BaseHTTPRequestHandler):
    def sync(self, parent, children):
        new_children = []
        status = {'phase': 'Initializing'}

        # Pull configuration from parent CRD
        name = parent['metadata']['name']

        new_children.append({
            'apiVersion': 'networking.k8s.io/v1',
            'kind': 'NetworkPolicy',
            'metadata': {
                'name': name,
                'namespace': 'cluster-namespaced'
            },
            'spec': {
                'podSelector': {},
                'policyTypes': ['Ingress']
            }
        })

        # Quick and dirty status
        if name in children['NetworkPolicy.networking.k8s.io/v1']:
            status['phase'] = 'Initialized'

        return {"status": status, "children": new_children}

    def do_POST(self):
        # Serve the sync() function as a JSON webhook.
        observed = json.loads(self.rfile.read(int(self.headers.getheader("content-length"))))
        desired = self.sync(observed["parent"], observed["children"])

        self.send_response(200)
        self.send_header("Content-type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(desired))

if __name__ == '__main__':
    HTTPServer(("", 80), Controller).serve_forever()