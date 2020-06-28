public class TestCAS {
    int i;

    public synchronized void incr(){
            i++;
    }
    public static void  main( String[] args){

        TestCAS testCAS = new TestCAS();

        for(int i=0;i<2;i++){
            new Thread(
                    () ->{
                        for(int k=0;k<10000;k++){
                            testCAS.incr();
                        }
                    }
            ).start();
        }

        try {
            Thread.currentThread().sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println(testCAS.i);
    }
}
