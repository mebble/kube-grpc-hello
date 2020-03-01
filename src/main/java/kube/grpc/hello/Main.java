package kube.grpc.hello;

import java.io.IOException;
import java.util.Optional;

import io.grpc.Server;
import io.grpc.ServerBuilder;

public class Main {
    public static void main(String[] args) throws IOException, InterruptedException {
        int PORT = Optional
            .ofNullable(System.getenv("PORT"))
            .map(Integer::parseInt)
            .orElse(9000);
        Server server = ServerBuilder.forPort(PORT)
                .addService(new HelloWorldService())
                .build()
                .start();
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                // Use stderr here since the logger may have been reset by its JVM shutdown hook.
                System.err.println("*** shutting down gRPC server since JVM is shutting down");
                server.shutdown();
                System.err.println("*** server shut down");
            }
        });
        System.out.println(String.format("Started listening for rpc calls on port %d...", PORT));
        server.awaitTermination();
    }
}
