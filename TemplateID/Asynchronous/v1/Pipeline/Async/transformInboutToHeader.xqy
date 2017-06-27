xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://service.ultra.com.br/infcorp/LogIntegration/v1";
(:: import schema at "../../v1/Schemas/MetaInformacao.xsd" ::)
declare namespace ctx="http://www.bea.com/wli/sb/context";
(:: import schema at "../../v1/Schemas/MessageContext.xsd" ::)

declare namespace soap="http://schemas.xmlsoap.org/soap/envelope/";
(:: import schema at "../../v1/Schemas/Soap-env.xsd" ::)

declare namespace tp="http://www.bea.com/wli/sb/transports";  

declare namespace func="http://www.w3.org/2005/xquery-local-functions";

declare variable $inbound as element() (:: schema-element(ctx:endpoint) ::) external;

declare function func:setRequestHeader($inboud as element() (:: schema-element(ctx:endpoint) ::)) as element() (:: schema-element(soap:Header) ::) 
{
     <soap:Header xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> 
          <ns1:MetaInformacao>
    
      	{  
    
        if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='nomeServico']/@value))  
          
        then  
        
        <ns1:nomeServico>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='nomeServico']/@value)}</ns1:nomeServico>  
          
        else  
          
        ()  
      
        
     	 }
        
         {  
  
        
        if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='datahoraRequisicao']/@value))  
          
        then  
        
        <ns1:datahoraRequisicao>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='datahoraRequisicao']/@value)}</ns1:datahoraRequisicao>  
          
        else()  
          
        } 
		{
           if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='mensagem']/@value))  
        
        then  
        
        <ns1:mensagem>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='mensagem']/@value)}</ns1:mensagem>  
          
        else()  
          
        }  
        
       {  
  
        
        if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='passoFluxo']/@value))  
          
        then  
        
        <ns1:passoFluxo>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='passoFluxo']/@value)}</ns1:passoFluxo>  
          
        else()  
          
        }
       {  
  
        
        if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='usuario']/@value))  
          
        then  
        
        <ns1:usuario>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='usuario']/@value)}</ns1:usuario>  
          
        else()  
          
        }  
        {  
  
        
        if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idControle']/@value))  
          
        then  
        
        <ns1:idControle>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='idControle']/@value)}</ns1:idControle>  
          
        else()  
          
        }  
        {  
  
        
        if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='sistemaOrigem']/@value))  
          
        then  
        
        <ns1:sistemaOrigem>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='sistemaOrigem']/@value)}</ns1:sistemaOrigem>  
          
        else()  
          
        }  
      
        {
           if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='sistemaDestino']/@value))  
        
        then  
        
        <ns1:sistemaDestino>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='sistemaDestino']/@value)}</ns1:sistemaDestino>  
          
        else()  
          
        } 
        {
           if (exists($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='status']/@value))  
        
        then  
        
        <ns1:status>{data($inbound/ctx:transport/ctx:request/tp:headers/tp:user-header[@name='status']/@value)}</ns1:status>  
          
        else()  
          
        }  
		
      
      

    </ns1:MetaInformacao>
     </soap:Header>
     
   
};

func:setRequestHeader($inbound)