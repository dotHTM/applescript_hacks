FasdUAS 1.101.10   ��   ��    k             l      ��  ��    b \

Rando Speaker

 By Mike Cramer
 imanerd as me dot com
 
Copy some text, run this script.

     � 	 	 � 
 
 R a n d o   S p e a k e r 
 
   B y   M i k e   C r a m e r 
   i m a n e r d   a s   m e   d o t   c o m 
   
 C o p y   s o m e   t e x t ,   r u n   t h i s   s c r i p t . 
 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        i         I     �� ��
�� .aevtoappnull  �   � ****  J          ��  o      ���� 	0 input  ��  ��    k     ,       l     ��������  ��  ��        r         I     	�� ���� 0 split Split      l    ����  c       !   o    ���� 	0 input   ! m    ��
�� 
TEXT��  ��     "�� " m     # # � $ $  
��  ��    o      ���� 0 thecontents theContents   % & % l   ��������  ��  ��   &  ' ( ' X    ' )�� * ) I    "�� +���� 0 	sayrandom 	sayRandom +  ,�� , o    ���� 0 thisparagraph thisParagraph��  ��  �� 0 thisparagraph thisParagraph * o    ���� 0 thecontents theContents (  - . - l  ( (��������  ��  ��   .  / 0 / L   ( * 1 1 o   ( )���� 0 thecontents theContents 0  2�� 2 l  + +��������  ��  ��  ��     3 4 3 l     ��������  ��  ��   4  5 6 5 i     7 8 7 I      �� 9���� 0 	sayrandom 	sayRandom 9  :�� : o      ���� 0 	inputtext 	inputText��  ��   8 k     . ; ;  < = < r      > ? > I     �� @���� 0 split Split @  A B A I   �� C��
�� .sysoexecTEXT���     TEXT C m     D D � E EB f i n d   / S y s t e m / L i b r a r y / S p e e c h / V o i c e s   - i n a m e   " * . S p e e c h V o i c e "   |   p e r l   - p e   " s / ( . * \ / | . * C o m p a c t . * \ n | . * S i r i . * \ n | . * V i c t o r i a . * \ n | . * F r e d . * \ n | . S p e e c h V o i c e ) / / g i "   |   u n i q   |   s o r t��   B  F�� F m     G G � H H  ��  ��   ? o      ���� 0 voicenamelist voiceNameList =  I J I l   ��������  ��  ��   J  K�� K Q    . L M N L k    ! O O  P Q P r     R S R I    �� T���� "0 getrandomitemof getRandomItemOf T  U�� U o    ���� 0 voicenamelist voiceNameList��  ��   S o      ����  0 therandomvoice theRandomVoice Q  V�� V I   !�� W X
�� .sysottosnull���     TEXT W o    ���� 0 	inputtext 	inputText X �� Y��
�� 
VOIC Y o    ����  0 therandomvoice theRandomVoice��  ��   M R      �� Z��
�� .ascrerr ****      � **** Z o      ���� 0 msg  ��   N I  ) .�� [��
�� .sysottosnull���     TEXT [ o   ) *���� 0 msg  ��  ��   6  \ ] \ l     ��������  ��  ��   ]  ^ _ ^ i     ` a ` I      �� b���� "0 getrandomitemof getRandomItemOf b  c�� c o      ���� 0 someinputlist someInputList��  ��   a L      d d e      e e n      f g f 4    �� h
�� 
cobj h l    i���� i I   ���� j
�� .sysorandnmbr    ��� nmbr��   j �� k l
�� 
from k m    ����  l �� m��
�� 
to   m l    n���� n I   �� o��
�� .corecnte****       **** o o    ���� 0 someinputlist someInputList��  ��  ��  ��  ��  ��   g o     ���� 0 someinputlist someInputList _  p q p l     ��������  ��  ��   q  r s r i     t u t I      �� v���� 0 split Split v  w x w o      ���� 0 	thestring 	theString x  y�� y o      ���� 0 thedelimiter theDelimiter��  ��   u k      z z  { | { l     �� } ~��   } . ( save delimiters to restore old settings    ~ �   P   s a v e   d e l i m i t e r s   t o   r e s t o r e   o l d   s e t t i n g s |  � � � r      � � � n     � � � 1    ��
�� 
txdl � 1     ��
�� 
ascr � o      ���� 0 olddelimiters oldDelimiters �  � � � l   �� � ���   � - ' set delimiters to delimiter to be used    � � � � N   s e t   d e l i m i t e r s   t o   d e l i m i t e r   t o   b e   u s e d �  � � � r     � � � o    ���� 0 thedelimiter theDelimiter � n      � � � 1    
��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   �   create the array    � � � � "   c r e a t e   t h e   a r r a y �  � � � r     � � � n     � � � 2    ��
�� 
citm � o    ���� 0 	thestring 	theString � o      ���� 0 thearray theArray �  � � � l   �� � ���   �   restore the old setting    � � � � 0   r e s t o r e   t h e   o l d   s e t t i n g �  � � � r     � � � o    ���� 0 olddelimiters oldDelimiters � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   �   return the result    � � � � $   r e t u r n   t h e   r e s u l t �  ��� � L     � � o    ���� 0 thearray theArray��   s  � � � l     ��������  ��  ��   �  � � � l     �������  ��  �   �  ��~ � l     �}�|�{�}  �|  �{  �~       �z � � � � ��z   � �y�x�w�v
�y .aevtoappnull  �   � ****�x 0 	sayrandom 	sayRandom�w "0 getrandomitemof getRandomItemOf�v 0 split Split � �u �t�s � ��r
�u .aevtoappnull  �   � ****�t �q ��q  �  �p�p 	0 input  �s   � �o�n�o 	0 input  �n 0 thisparagraph thisParagraph � �m #�l�k�j�i�h�g
�m 
TEXT�l 0 split Split�k 0 thecontents theContents
�j 
kocl
�i 
cobj
�h .corecnte****       ****�g 0 	sayrandom 	sayRandom�r -*��&�l+ E�O �[��l kh *�k+ [OY��O�OP � �f 8�e�d � ��c�f 0 	sayrandom 	sayRandom�e �b ��b  �  �a�a 0 	inputtext 	inputText�d   � �`�_�^�]�` 0 	inputtext 	inputText�_ 0 voicenamelist voiceNameList�^  0 therandomvoice theRandomVoice�] 0 msg   � 	 D�\ G�[�Z�Y�X�W�V
�\ .sysoexecTEXT���     TEXT�[ 0 split Split�Z "0 getrandomitemof getRandomItemOf
�Y 
VOIC
�X .sysottosnull���     TEXT�W 0 msg  �V  �c /*�j �l+ E�O *�k+ E�O��l W X  �j  � �U a�T�S � ��R�U "0 getrandomitemof getRandomItemOf�T �Q ��Q  �  �P�P 0 someinputlist someInputList�S   � �O�O 0 someinputlist someInputList � �N�M�L�K�J�I
�N 
cobj
�M 
from
�L 
to  
�K .corecnte****       ****�J 
�I .sysorandnmbr    ��� nmbr�R ��*�k�j � /E � �H u�G�F � ��E�H 0 split Split�G �D ��D  �  �C�B�C 0 	thestring 	theString�B 0 thedelimiter theDelimiter�F   � �A�@�?�>�A 0 	thestring 	theString�@ 0 thedelimiter theDelimiter�? 0 olddelimiters oldDelimiters�> 0 thearray theArray � �=�<�;
�= 
ascr
�< 
txdl
�; 
citm�E ��,E�O���,FO��-E�O���,FO�ascr  ��ޭ