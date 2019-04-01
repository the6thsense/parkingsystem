$r=1; for($i=0;$i<5;$i++) {print" column_"; print $i+1; print" " ;} print"\n"; $countofrow=1; for($i=1;$i<=2400;$i++) { if ($countofrow%6 && $countofrow!=0) {print" ";$spaceblanknum++; } else { print "@";

                }
                
                if($i%16==0)
                {  print"\|";
                }
     
               if($i%480==0&&$i!=0)
                {  print "  parking_row";
                   print $countofrow/6;
                }
     
               if($i%80==0)
                 {  print "\n";           
                    $countofrow++;
                 }
             }
@carpos= (['slot 11','slot 12','slot 13','slot 14','slot 15'], ['slot 21','slot 22','slot 23','slot 24','slot 25'], ['slot 31','slot 32','slot 33','slot 34','slot 35'], ['slot 41','slot 42','slot 43','slot 44','slot 45'], ['slot 51','slot 52','slot 53','slot 54','slot 55']);

while(1) { if($fakenum==0) { print"\n\n\n\n1. (for officials only) To get detail of a car in parking: print<space> carnumber\n\n2. To get the car exit from lot: get<space>carnum\n\nenter your car number "; }

     else
       {    $fakenum=$fakenum-1;
       }

     $carnum=<STDIN>;

    if($carnum=~/\S/)
      { chomp $carnum;

        if ($carnum eq $$carnum[1])
          { print "\n\n__________________________________________________________\n
 >>>>>>> Sorry! This car is already present in the parking lot\n
 _________________________________________________________________\n\n\n";next;}

             if ($carnum=~/get/)
                 {$searchfor=substr($carnum,4,7);
                 chomp $searchfor;

                         if($searchfor == $carnum)
                            {
                              print "\n\n\n>>>>>>>      kindy enter your 4 digit parking code: ";
                              $verifycode=<STDIN>;
                              chomp $verifycode;


                                  if ($verifycode eq $$searchfor[2])
                                   {       #print $searchfor;
                                       print "                                          *********************************************\n
                                     !!!!!!!!!!!! HaPPy  JoUrNeY !!!!!!!!!!!!\n
                              *********************************************";
                                        $vacancy++;
                                        @$vacancy[0]=$$searchfor[0];
                                         undef $$searchfor[1];
                                         undef $$searchfor[2];
                                         undef $$searchfor[0];

                                            
                                         next;
                                    }

                                    else
                                    {       print "\n\n                              ****************************************************************\n
                                    >>>>>>>>> OOPS!!you entered a wrong code or this is not your car\n\n
                                   ****************************************************************" ;
                                    next; 
                                    
                                    }
                                    
                            }
                   }
   
                if($carnum=~/print/)
                   {
                         $searchfor=substr($carnum,6,7);
                         print "\n\n ***********************************************************************************************************************\n\n
                                       (I).    position: $$searchfor[0]\n\n 
                                       (II).   Carnum:   $$searchfor[1]\n\n 
                                       (III).  code:     $$searchfor[2] \n\n
********************************************************************************************\n ";

                          next;
                    }

                $cod= time();
                @cod=split ('',$cod);
                   
                $code=$cod[6].$cod[8].$cod[9].$cod[5];
    
                $position= $carpos[$row][$clm];
      
               
                if ($row<5 && $clm<5)
                   {       if ($vacancy!=0)
                            { $position=$$vacancy[0];
                              $vacancy--;
                              $clm--; }
 
                 print "\n\n*******************************************************************************************************************\n\n
                        >>>>  kindly remember the parking code and parking details are as follows:\n\n  
                        (I).   carnum: $carnum\n\n   
                        (II).   code: $code\n\n  
                        (III).  position: $position\n\n
******************************************************************************************************************\n >>>>>>>>> (for reference) parking slot alotted is as shown in map <<<<<<<<<<\n\n\n\n";

                           @$carnum=($position,$carnum,$code); 
   
                           $cgiven=substr($position,6,1);
    
                           $rgiven=substr($position,5,1);


                           $r=1;
                           
                           
                           for($i=0;$i<5;$i++)
                              {   print"    column_"; 
                                  print $i+1;             #$i : to represent the position of the letter being typed in the program
                                  print"     " ;
                               }
                           print"\n";
                           $countofrow=1;
                           $bs=1;
                           
                           
                           for($i=0;$i<2500-100-68;++$i)
                              {
                                   
                                    if ($i%16!=0)
                                           {$bs++;
                                           }                 #bs: no. of space or non spaces excluding ...|...
         
                                    if ($countofrow%6&& $countofrow)
                                            { 
                                                
                                               if ($i>480*$rgiven-480+16*$cgiven-15&&$i<$rgiven*480-480+16*$cgiven)    
                                                  {
                                                     print"^";
                                                  }     #logic =  480*(ROWNO-1) +16(column no-1)+1<$i<16(column no)+480*rowno.
     
         
                                                else 
                                                 {print" ";
                                                 }
                                             }
         
                                    else
                                             {print "@";
                                               #$s++;
                                              }
   
                                    if($i%16==0)
                                             { print"\|";
                                              }
     
                                    if($i%480==0&&$i!=0)
                                              { print "";
                                              }
      
                                    if($i%80==0)
                                              { print "\n";           
                                                $countofrow++;
                                               }
                               }
                         }
      
                     @$carnum=("$position","$carnum","$code");


                     if ($row==4 && $clm==4)
                       {print "\n\n\n                             >>>>>>>>>>>>>>>  NO PARKING SPACE   <<<<<<<<<<<<<
                                        n please wait till any parking lot is vacated.
                                                 The inconvenience caused is deeply 
                                                  regreted. \n\n\n"
                       }
       
                    $car++;   
                    $clm++;

                    if($clm==5)
                       {  $row++;
                          $clm=0;
                       }

                    if ($i==2400)
                       {$bs=1
                       }
           }


       else
           {$fakenum++;next;
           }
}

© 2019 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
