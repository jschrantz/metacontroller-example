# metacontroller-example

A quick and dirty example repository to demonstrate a bug in metacontroller.

When you have a CompositeController with a Cluster Scoped parent and a Namespace
Scoped child, events on the child seem to be ignored.

In this repository are 3 different examples, showing various parent child
relationships of CompositeControllers. All of them have a deploy.sh,
undeploy.sh, and test.sh script. deploy.sh sets up the controller, undeploy.sh
removes it from the cluster, test.sh runs a simple bash script that runs through
some steps to show the bugs.

Here are some overviews of the examples:

<dl>
    <dt>namespaced-namespaced/</dt>
    <dd>A CompositeController with a Namespace Scoped parent and Namespace scoped 
        children. test.sh works in this case.
    </dd>
    <dt>cluster-namespaced/</dt>
    <dd>A CompositeController with a Cluster Scoped parent and Namespace scoped 
        child. test.sh shows that the events of the child are not causing sync 
        calls.
    </dd>
    <dt>cluster-mixed/</dt>
    <dd>A CompositeController with a Cluster Scoped parent and both Cluster and
        Namespace scoped children. test.sh shows that the events of the Namespace
        scoped child are not causing sync calls, but the Cluster scoped child 
        works.
    </dd>
</dl>
