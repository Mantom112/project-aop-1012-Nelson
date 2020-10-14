
public aspect TraceAspectNelson {
	
	pointcut class2trace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut method2trace(): class2trace() && execution(String getName());
	
	before(): method2trace() {
		String info = thisJoinPointStaticPart.getSignature() + " , " 
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		
		System.out.println("Before the Method : " + info);
	}
	
	after(): method2trace() {
		System.out.println("After the method : " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}

}
