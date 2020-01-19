package com.gx.ext.message;

import javax.jms.*;

public class ProxyConnection implements Connection {
    private ProxyConnectionFactory connectionFactory;
    private ProxySession proxySession;

    public ProxyConnection(ProxyConnectionFactory connectionFactory) {
        this.connectionFactory = connectionFactory;
        proxySession = new ProxySession(this);
    }

    public Session createSession(boolean transacted, int acknowledgeMode)
            throws JMSException {
        return proxySession;
    }

    public String getClientID() throws JMSException {
        return null;
    }

    public void setClientID(String clientID) throws JMSException {
    }

    public ConnectionMetaData getMetaData() throws JMSException {
        return null;
    }

    public ExceptionListener getExceptionListener() throws JMSException {
        return null;
    }

    public void setExceptionListener(ExceptionListener listener)
            throws JMSException {
    }

    public void start() throws JMSException {
    }

    public void stop() throws JMSException {
    }

    public void close() throws JMSException {
    }

    public ConnectionConsumer createConnectionConsumer(Destination destination,
            String messageSelector, ServerSessionPool sessionPool,
            int maxMessages) throws JMSException {
        return null;
    }

    public ConnectionConsumer createDurableConnectionConsumer(Topic topic,
            String subscriptionName, String messageSelector,
            ServerSessionPool sessionPool, int maxMessages) throws JMSException {
        return null;
    }

    // ~ ==================================================
    public void sendMessage(Destination destination, String text) {
        this.connectionFactory.sendMessage(destination, text);
    }

    public Message getMessage(ProxyMessageConsumer proxyMessageConsumer) {
        return connectionFactory.getMessage(proxyMessageConsumer);
    }

    public MessageConsumer createConsumer(Destination destination,
            ProxySession session) {
        return connectionFactory.createConsumer(destination, session);
    }

    public void removeMessageConsumer(ProxyMessageConsumer messageConsumer) {
        connectionFactory.removeMessageConsumer(messageConsumer);
    }

    public MessageProducer createProducer(Destination destination,
            ProxySession session) {
        return connectionFactory.createProducer(destination, session);
    }
}
