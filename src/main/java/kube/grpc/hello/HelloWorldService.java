package kube.grpc.hello;

import io.grpc.stub.StreamObserver;

public class HelloWorldService extends HelloWorldGrpc.HelloWorldImplBase {
    @Override
    public void sayHello(HelloRequest req, StreamObserver<HelloReply> resObserver) {
        HelloReply reply = HelloReply.newBuilder()
                .setText("Hey! You sent me: " + req.getText())
                .build();
        resObserver.onNext(reply);
        resObserver.onCompleted();
    }
}
