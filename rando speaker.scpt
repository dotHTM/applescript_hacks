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
�� .aevtoappnull  �   � ****  J          ��  o      ���� 	0 input  ��  ��    k     ,       l     ��������  ��  ��        l     ��������  ��  ��        r         I     	�� ���� 0 split Split       l    !���� ! c     " # " o    ���� 	0 input   # m    ��
�� 
TEXT��  ��      $�� $ m     % % � & &  
��  ��    o      ���� 0 thecontents theContents   ' ( ' l   ��������  ��  ��   (  ) * ) X    ' +�� , + I    "�� -���� 0 	sayrandom 	sayRandom -  .�� . o    ���� 0 thisparagraph thisParagraph��  ��  �� 0 thisparagraph thisParagraph , o    ���� 0 thecontents theContents *  / 0 / l  ( (��������  ��  ��   0  1 2 1 L   ( * 3 3 o   ( )���� 0 thecontents theContents 2  4�� 4 l  + +��������  ��  ��  ��     5 6 5 l     ��������  ��  ��   6  7 8 7 i     9 : 9 I      �� ;���� 0 	sayrandom 	sayRandom ;  <�� < o      ���� 0 	inputtext 	inputText��  ��   : k     @ = =  > ? > r      @ A @ I     �� B���� 0 split Split B  C D C I   �� E��
�� .sysoexecTEXT���     TEXT E m     F F � G GB f i n d   / S y s t e m / L i b r a r y / S p e e c h / V o i c e s   - i n a m e   " * . S p e e c h V o i c e "   |   p e r l   - p e   " s / ( . * \ / | . * C o m p a c t . * \ n | . * S i r i . * \ n | . * V i c t o r i a . * \ n | . * F r e d . * \ n | . S p e e c h V o i c e ) / / g i "   |   u n i q   |   s o r t��   D  H�� H m     I I � J J  ��  ��   A o      ���� 0 voicenamelist voiceNameList ?  K L K l   ��������  ��  ��   L  M N M r     O P O m    ����   P o      ���� 0 	failcount 	failCount N  Q R Q r     S T S m    ��
�� boovtrue T o      ���� 0 	tryfailed 	tryFailed R  U�� U Q    @ V W X V k    - Y Y  Z [ Z r    ! \ ] \ I    �� ^���� "0 getrandomitemof getRandomItemOf ^  _�� _ o    ���� 0 voicenamelist voiceNameList��  ��   ] o      ����  0 therandomvoice theRandomVoice [  ` a ` I  " )�� b c
�� .sysottosnull���     TEXT b o   " #���� 0 	inputtext 	inputText c �� d��
�� 
VOIC d o   $ %����  0 therandomvoice theRandomVoice��   a  e�� e r   * - f g f m   * +��
�� boovfals g o      ���� 0 	tryfailed 	tryFailed��   W R      �� h��
�� .ascrerr ****      � **** h o      ���� 0 msg  ��   X k   5 @ i i  j k j r   5 : l m l [   5 8 n o n o   5 6���� 0 	failcount 	failCount o m   6 7����  m o      ���� 0 	failcount 	failCount k  p�� p I  ; @�� q��
�� .sysottosnull���     TEXT q o   ; <���� 0 msg  ��  ��  ��   8  r s r l     ��������  ��  ��   s  t u t i     v w v I      �� x���� "0 getrandomitemof getRandomItemOf x  y�� y o      ���� 0 someinputlist someInputList��  ��   w L      z z e      { { n      | } | 4    �� ~
�� 
cobj ~ l    ����  I   ���� �
�� .sysorandnmbr    ��� nmbr��   � �� � �
�� 
from � m    ����  � �� ���
�� 
to   � l    ����� � I   �� ���
�� .corecnte****       **** � o    ���� 0 someinputlist someInputList��  ��  ��  ��  ��  ��   } o     ���� 0 someinputlist someInputList u  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 split Split �  � � � o      ���� 0 	thestring 	theString �  ��� � o      ���� 0 thedelimiter theDelimiter��  ��   � k      � �  � � � l     �� � ���   � . ( save delimiters to restore old settings    � � � � P   s a v e   d e l i m i t e r s   t o   r e s t o r e   o l d   s e t t i n g s �  � � � r      � � � n     � � � 1    ��
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
citm � o    ���� 0 	thestring 	theString � o      �� 0 thearray theArray �  � � � l   �~ � ��~   �   restore the old setting    � � � � 0   r e s t o r e   t h e   o l d   s e t t i n g �  � � � r     � � � o    �}�} 0 olddelimiters oldDelimiters � n      � � � 1    �|
�| 
txdl � 1    �{
�{ 
ascr �  � � � l   �z � ��z   �   return the result    � � � � $   r e t u r n   t h e   r e s u l t �  ��y � L     � � o    �x�x 0 thearray theArray�y   �  � � � l     �w�v�u�w  �v  �u   �  � � � l     �t�s�r�t  �s  �r   �  ��q � l     �p�o�n�p  �o  �n  �q       
�m � � � � � ��l�k�j�m   � �i�h�g�f�e�d�c�b
�i .aevtoappnull  �   � ****�h 0 	sayrandom 	sayRandom�g "0 getrandomitemof getRandomItemOf�f 0 split Split�e 0 thecontents theContents�d  �c  �b   � �a �`�_ � ��^
�a .aevtoappnull  �   � ****�` �] ��]  �  �\�\ 	0 input  �_   � �[�Z�[ 	0 input  �Z 0 thisparagraph thisParagraph � �Y %�X�W�V�U�T�S
�Y 
TEXT�X 0 split Split�W 0 thecontents theContents
�V 
kocl
�U 
cobj
�T .corecnte****       ****�S 0 	sayrandom 	sayRandom�^ -*��&�l+ E�O �[��l kh *�k+ [OY��O�OP � �R :�Q�P � ��O�R 0 	sayrandom 	sayRandom�Q �N ��N  �  �M�M 0 	inputtext 	inputText�P   � �L�K�J�I�H�G�L 0 	inputtext 	inputText�K 0 voicenamelist voiceNameList�J 0 	failcount 	failCount�I 0 	tryfailed 	tryFailed�H  0 therandomvoice theRandomVoice�G 0 msg   � 	 F�F I�E�D�C�B�A�@
�F .sysoexecTEXT���     TEXT�E 0 split Split�D "0 getrandomitemof getRandomItemOf
�C 
VOIC
�B .sysottosnull���     TEXT�A 0 msg  �@  �O A*�j �l+ E�OjE�OeE�O *�k+ E�O��l OfE�W X  �kE�O�j  � �? w�>�= � ��<�? "0 getrandomitemof getRandomItemOf�> �; ��;  �  �:�: 0 someinputlist someInputList�=   � �9�9 0 someinputlist someInputList � �8�7�6�5�4�3
�8 
cobj
�7 
from
�6 
to  
�5 .corecnte****       ****�4 
�3 .sysorandnmbr    ��� nmbr�< ��*�k�j � /E � �2 ��1�0 � ��/�2 0 split Split�1 �. ��.  �  �-�,�- 0 	thestring 	theString�, 0 thedelimiter theDelimiter�0   � �+�*�)�(�+ 0 	thestring 	theString�* 0 thedelimiter theDelimiter�) 0 olddelimiters oldDelimiters�( 0 thearray theArray � �'�&�%
�' 
ascr
�& 
txdl
�% 
citm�/ ��,E�O���,FO��-E�O���,FO� � �$ ��$  �   � � � ��#�"�!� �������� � � � � D     t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s " � � � � �                 i f   a p p l i c a t i o n   p r o c e s s   " A d o b e   P h o t o s h o p   C C   2 0 1 7 "   e x i s t s   t h e n � � � � R                         s e t   p h o t o s h o p L a u n c h e d   t o   t r u e � � � �                  e l s e�#  �"  �!  �   �  �  �  �  �  �  �  �  �l  �k  �j   ascr  ��ޭ