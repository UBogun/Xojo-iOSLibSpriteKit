#tag IOSView
Begin iosView SpriteKitView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin ioslibskviewer ImageView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowsTransparency=   False
      Asynchronous    =   False
      AutoLayout      =   ImageView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ImageView1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   ImageView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ImageView1, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, 
      FrameInterval   =   0
      Height          =   407.0
      IgnoresSiblingOrder=   False
      Left            =   0
      LockedInPosition=   False
      Paused          =   False
      Scope           =   0
      ShouldCullNonVisibleNodes=   False
      ShowsDrawCount  =   False
      ShowsFields     =   False
      ShowsFPS        =   False
      ShowsNodeCount  =   False
      ShowsPhysics    =   False
      ShowsQuadCount  =   False
      Top             =   73
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim button As iOSToolButton
		  
		  button = iOSToolButton.NewBordered("Intro")
		  Toolbar.Add(button)
		  
		  
		  button = iOSToolButton.NewBordered("SpaceShooter")
		  Toolbar.Add(button)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  select case button.Caption
		  case "Spaceshooter"
		    Spaceshooter
		  case "Intro"
		    ShootWorld
		  end select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub analyzeCollision(contact as iOSLibSKPhysicsContact)
		  // This event is only processed when a Spaceshooter game is running
		  
		  dim ObjectA as iOSLibSKPhysicsBody = contact.BodyA // get both collision objects
		  dim objectb as iOSLibSKPhysicsBody = contact.BodyB
		  
		  if (ObjectA.CategoryBitMask and BulletCategory) = BulletCategory then // Our bullet
		    if (Objectb.CategoryBitMask and EnemyCategory) = EnemyCategory then //  hit an enemy (can be an enemy's bullet or an enemy ship)
		      objectb.Node.RunAction (iOSLibSKAction.Sequence (iOSLibSKAction.FadeOut (0.3), iOSLibSKAction.RemoveFromParent)) // remoce it with a fade-out
		    end if
		  elseif (ObjectA.CategoryBitMask and FighterCategory) = FighterCategory and (objectb.CategoryBitMask and EnemyCategory)  = EnemyCategory then // enemy hit us
		    objectb.Node.RunAction (iOSLibSKAction.Sequence (iOSLibSKAction.FadeOut (0.3), iOSLibSKAction.RemoveFromParent)) // remove both
		    objecta.Node.RunAction (iOSLibSKAction.Sequence (iOSLibSKAction.FadeOut (0.3), iOSLibSKAction.RemoveFromParent))
		  elseif (Objecta.CategoryBitMask and EnemyCategory) = EnemyCategory then // Enemy bullet hit our bullet
		    if ( objectb.CategoryBitMask and BulletCategory) = BulletCategory then
		      objecta.Node.RunAction (iOSLibSKAction.Sequence (iOSLibSKAction.FadeOut (0.3), iOSLibSKAction.RemoveFromParent)) // remove enemy bullet
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CalculateEnemyMove()
		  // Part of Spaceshooter: Calculates an Enemy move. This method is called whenever one of the enemies finishes its move.
		  
		  dim enemies as iOSLibArray = SpaceShooterScene.ChildNodes(Enemy1Name) // get all enemies
		  for q as uinteger = 0 to enemies.Count -1
		    dim enemy as iOSLibSKNode = iOSLibSKNode.MakeFromPtr (enemies.PtrAtIndex(q)) // rertieve one
		    if enemy <> nil then // probably unnecessary, but in any case: Make sure it still exists
		      if not enemy.ExecutesActions then // is it idle?
		        dim currentfighter as iOSLibSKnode = SpaceShooterScene.childnode( FighterName) // and then find out where our ship is located
		        if currentfighter <> nil then
		          dim xpos as Double = currentfighter.Position.x + randomint (-100,100) // don't be too exact.
		          dim ypos as double = ImageView1.Height - randomint (50, ImageView1.Height/2) // choose a random height
		          dim location as NSPoint =NSPoint (xpos, ypos) // save this point
		          
<<<<<<< HEAD
		          dim enemyvelocity as double = ImageView1.Width / 3.5
		          dim movedifference as nspoint = location.VectorSubtract (Enemy.Position)
		          dim distance as double = movedifference.Magnitude
		          dim duration as double = distance / enemyvelocity
=======
		          dim fightervelocity as double = ImageView1.Width / 3.5
		          // dim movedifference as nspoint = nspoint (location.x - bear.Position.x, location.y - bear.position.y)
		          dim movedifference as nspoint = location.Vector_Subtract (Enemy.Position)
		          dim distance as double = sqrt (movedifference.x * movedifference.x + movedifference.y * movedifference.y)
		          dim duration as double = distance / fightervelocity
>>>>>>> I am really sorry – SourceControl brought some interference and after reimporting iOSLib SpriteKit did not want to show anything anymore. So here a re-up with iOSLib bundled – seems to be the best idea for now.
		          
		          dim wait as iOSLibSKAction = iOSLibSKAction.Wait (randomint (0, 100)/100)
		          dim moveaction as iOSLibSKAction = iOSLibSKAction.MoveTo (location, duration)
		          
		          dim block as new iOSBlock (AddressOf Enemy1MoveEnded)
		          dim doneaction as iOSLibSKAction = iOSLibSKAction.RunBlock (block)
		          dim moveactionWithdone as iOSLibSKAction = iOSLibSKAction.Sequence (wait, moveaction, doneaction)
		          enemy.RunActionWithKey (moveactionWithdone,EnemyMovingName)
		        end if
		      end if
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateEnemy()
		  if SpaceShooterScene.ChildNodes(Enemy1Name).count < MaxEnemies then // don't flood the screen with enemies
		    dim NewEnemy as new iOSLibSKSpriteNode (Enemy1Texture)
		    // NewEnemy.setScale  1/ImageView1.view.ContentScaleFactor // scale it so it matches the display resolution
		    
		    dim enemybody as new iOSLibSKPhysicsBody (NewEnemy) // create a physics body
		    
		    enemybody.CategoryBitMask = EnemyCategory
		    // enemybody.ContactTestBitMask = FighterCategory or ObjectCategory or BulletCategory
		    enemybody.CollisionBitMask = FighterCategory or ObjectCategory or BulletCategory
		    enemybody.AffectedByGravity = false
		    NewEnemy.PhysicsBody = enemybody
		    
		    NewEnemy.Position = NSPoint (randomint (-20, ImageView1.Width+20), ImageView1.height + 50) // Position it a bit over the view bounds
		    NewEnemy.Name = Enemy1Name
		    SpaceShooterScene.AddChild NewEnemy // make it appear
		    dim moveaction as iOSLibSKAction = iOSLibSKAction.MoveToY (ImageView1.Height - randomint (100, 250), 2) // and prepare it to move
		    
		    dim block as new iOSBlock (AddressOf Enemy1MoveEnded)
		    dim doneaction as iOSLibSKAction = iOSLibSKAction.RunBlock (block)
		    dim moveactionWithdone as iOSLibSKAction = iOSLibSKAction.Sequence (moveaction, doneaction)
		    NewEnemy.RunActionWithKey (moveactionWithdone, EnemyMovingName)
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateFighter()
		  FighterNormalTexture = new iOSLibSKTexture(FighterName)  // Set up and store the textures for the fighter
		  FighterLeftTexture = new iOSLibSKTexture("FighterLeft")
		  FighterRightTexture = new iOSLibSKTexture("FighterRight")
		  FighterDamagedTexture = new iOSLibSKTexture("FighterDamaged")
		  
		  
		  FighterNormal = new iOSLibSKSpriteNode (FighterNormalTexture) // now create a Sprite with the normal image
		  // FighterNormal.setScale  1/ImageView1.view.ContentScaleFactor // scale it so it matches the display resolution
		  FighterNormal.BlendMode = iOSLibSKNode.SKBlendMode.Screen
		  FighterNormal.Position = NSPoint (ImageView1.Width/2, FighterNormal.Frame.Size_.height * 2) // and place it in the middle just a bit above the bottom
		  
		  dim FighterBody as new iOSLibSKPhysicsBody (FighterNormal) // now add a rectangular physics body for collision detection
		  FighterBody.CategoryBitMask = FighterCategory // and assing it the category
		  // FighterBody.ContactTestBitMask = EnemyCategory // Enemies are spaceships and their bullets, only register collisions and contacts with them
		  // FighterBody.CollisionBitMask = EnemyCategory
		  // FighterBody.PreciseCollisionDetection = true // and in case the fighter moves fast, be exact
		  FighterBody.AffectedByGravity = false // we don't need no gravity for fighters
		  FighterNormal.PhysicsBody = FighterBody // now assigning the phyics body to the SpriteNode
		  
		  FighterNormal.Name = FighterName
		  
		  // now prepare the Bullets
		  
		  GreenshotTexture = new iOSLibSKTexture ("GreenShot")
		  
		  RedshotTexture = new iOSLibSKTexture ("RedShot")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateStar()
		  dim random as integer = randomint (0,100000)
		  select case random
		  case 5 to 20000
		    dim astar as iOSLibSKShapeNode = iOSLibSKShapeNode.Circle (randomint(1,10) / 10)
		    astar.FillColor = astar.StrokeColor
		    astar.GlowWidth = astar.Frame.Size_.width *( randomint (0,5)/10)
		    astar.Position = nspoint (randomint(0,ImageView1.Width), ImageView1.Height + 10)
		    SpaceShooterScene.ChildNode(SpaceLayerName).AddChild astar
		    astar.RunActionWithKey (starfall, StarFallName)
		  case 95000 to 99000
		    CalculateEnemyMove
		  case 99050 to 100000
		    CreateEnemy
		  end select
		  if SpaceShooterScene.ChildNodes(Enemy1Name).Count = 0 then
		    dim createblock as new iOSBlock (AddressOf CreateEnemy)
		    SpaceShooterScene.RunAction (iOSLibSKAction.Sequence (iOSLibSKAction.Wait (2, 2), iOSLibSKAction.RunBlock (createblock)))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Enemy1MoveEnded()
		  Enemyshoot
		  calculateenemyMove
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnemyShoot()
		  dim enemy as iOSLibSKNode = SpaceShooterScene.ChildNode(Enemy1Name)
		  if not enemy.isnil then
		    dim Enemybullet as  new iOSLibSKSpriteNode (RedshotTexture)
		    // Enemybullet.setScale  1/ImageView1.view.ContentScaleFactor // scale it so it matches the display resolution
		    
		    dim Redshotbody as new iOSLibSKPhysicsBody (enemybullet)
		    Redshotbody.CategoryBitMask = EnemyCategory
		    Redshotbody.ContactTestBitMask = FighterCategory or ObjectCategory
		    // Redshotbody.CollisionBitMask = FighterCategory or ObjectCategory
		    Redshotbody.AffectedByGravity = false
		    Redshotbody.PreciseCollisionDetection = true
		    Enemybullet.PhysicsBody = Redshotbody
		    
		    Enemybullet.Position = nspoint (enemy.Position.x, enemy.Position.y - enemy.Frame.Size_.height / 2)
		    SpaceShooterScene.AddChild Enemybullet
		    
		    enemybullet.RunAction enemyshot
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FighterMoveEnded()
		  FighterNormal.RunAction(TextureNormalaction)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FighterReloadDelayBlock()
		  CanShoot = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FighterShoot()
		  if CanShoot then
		    dim Fighterbullet as  new iOSLibSKSpriteNode (GreenshotTexture)
		    // Fighterbullet.setScale  1/ImageView1.view.ContentScaleFactor // scale it so it matches the display resolution
		    
		    dim Greenshotbody as new iOSLibSKPhysicsBody (FighterBullet.Frame.Size_)
		    Greenshotbody.CategoryBitMask = BulletCategory
		    Greenshotbody.ContactTestBitMask = EnemyCategory or ObjectCategory
		    Greenshotbody.CollisionBitMask = EnemyCategory or ObjectCategory
		    Greenshotbody.AffectedByGravity = false
		    Greenshotbody.PreciseCollisionDetection = true
		    FighterBullet.PhysicsBody = Greenshotbody
		    
		    FighterBullet.Position = nspoint (FighterNormal.Position.x, FighterNormal.Position.y + FighterNormal.Frame.Size_.height / 2)
		    SpaceShooterScene.AddChild FighterBullet
		    CanShoot = false
		    dim block as new iOSBlock (AddressOf FighterReloadDelayBlock)
		    FighterBullet.RunAction FighterShot
		    SpaceShooterScene.RunAction iOSLibSKAction.Sequence (iOSLibSKAction.Wait (FighterReloadTime), iOSLibSKAction.RunBlock (block))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveEnded()
		  dim bear as iOSLibSKNode = WalkScene.ChildNode("bear") // retrieve our sprite
		  bear.RemoveActionForKey "WalkingBear"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessSpaceShooterTouch(touchset as ioslibset, asnevent as iOSLibEvent)
		  dim touch as ioslibsktouch = ioslibsktouch.MakeFromPtr (touchset.AllObjects.PtrAtIndex(0)) // get the first touch item of the array
		  dim location as NSPoint = touch.LocationInNode (SpaceShooterScene) // and convert its point to view points
		  
		  if Location.y > FighterNormal.Frame.Size_.height * 6 then location.y = FighterNormal.Frame.Size_.height * 6 // limit the y position, don't get too close to the upper bounds
		  dim FighterVelocity as double = ImageView1.Width / FighterSpeed // calculate the speed, standardly fighter takes 2 secons to cross the screen width
<<<<<<< HEAD
		  dim movedifference as nspoint = location.VectorSubtract( FighterNormal.Position)
		  dim distance as double = movedifference.Magnitude
=======
		  dim movedifference as nspoint = location.Vector_Subtract( FighterNormal.Position)
		  dim distance as double = sqrt (movedifference.x * movedifference.x + movedifference.y * movedifference.y)
>>>>>>> I am really sorry – SourceControl brought some interference and after reimporting iOSLib SpriteKit did not want to show anything anymore. So here a re-up with iOSLib bundled – seems to be the best idea for now.
		  dim duration as double = distance / FighterVelocity
		  
		  dim textureaction as iOSLibSKAction =  if (movedifference.x <0, TextureLeftAction, if (movedifference.x > 0, TextureRightaction, TextureNormalaction))
		  dim moveaction as iOSLibSKAction = iOSLibSKAction.MoveTo (location, duration)
		  dim block as new iOSBlock (AddressOf FighterMoveEnded)
		  dim doneaction as iOSLibSKAction = iOSLibSKAction.RunBlock (block)
		  dim moveactionWithdone as iOSLibSKAction = iOSLibSKAction.Sequence (textureaction, moveaction, doneaction)
		  FighterNormal.RunActionWithKey (moveactionWithdone, FighterMovingName)
		  
		  if touch.TapCount > 1 then FighterShoot
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShootWorld()
		  dim myscene as new iOSLibSKSceneWithInterface (ImageView1.View.frame.Size_, ImageView1)
		  myscene.PhysicsWorld.Gravity = CGVector (0,-0.05)
		  ImageView1.PresentScene myscene
		  
		  
		  // Labelnode
		  for q as integer = 0 to 15
		    dim mynode as new iOSLibSKLabelNode ("iOSLibSpriteKit is here!", "Menlo Bold")
		    mynode.FontSize =  randomint (3,40)
		    mynode.VerticalAlignment = iOSLibSKLabelNode.SKLabelVerticalAlignmentMode.Center
		    myscene.AddChild mynode
		    mynode.Position = NSPoint ( randomint (20, ImageView1.width - 20),  randomint (10, ImageView1.height- 100))
		    mynode.BlendColor = new iOSLibColor (&cff229933)
		    mynode.ColorBlendFactor = 0.5
		    
		    dim firstbody as new iOSLibSKPhysicsBody (mynode.Frame.Size_)
		    firstbody.CategoryBitMask = ObjectCategory
		    firstbody.ContactTestBitMask = ObjectCategory or BulletCategory or BorderCategory
		    firstbody.CollisionBitMask = ObjectCategory or BulletCategory or BorderCategory
		    firstbody.PreciseCollisionDetection = true
		    firstbody.Mass = randomint (0, 2)
		    firstbody.LinearDamping = 0.1
		    firstbody.AngularDamping = 0.1
		    firstbody.Restitution = 0.95
		    firstbody.Dynamic = true
		    firstbody.AffectedByGravity = true
		    mynode.PhysicsBody = firstbody
		    firstbody.ApplyImpulse (CGVector(randomint (-1000, 1000), randomint (-1000, 1000)))
		    
		  next
		  
		  
		  // Bullet
		  
		  dim anothernode as new iOSLibSKSpriteNode (new iOSLibColor(&c99992222), NSSize (15,15))
		  dim myaction as iOSLibSKAction = iOSLibSKAction.PlaySound ("scifi016.mp3", false)
		  anothernode.RunActionWithEvent myaction
		  myscene.AddChild anothernode
		  myaction = iOSLibSKAction.MoveTo (NSPoint( ImageView1.iOSLibView.Frame.Size_.width/2 + 80, ImageView1.Height + anothernode.Frame.Size_.height * 2), 2)
		  
		  
		  dim mybody as new iOSLibSKPhysicsBody (anothernode.Frame.Size_)
		  mybody.CategoryBitMask = BulletCategory
		  mybody.CollisionBitMask = ObjectCategory or BulletCategory or BorderCategory
		  
		  mybody.Mass = 1
		  mybody.AffectedByGravity = true
		  mybody.PreciseCollisionDetection = true
		  anothernode.PhysicsBody = mybody
		  anothernode.RunActionWithKey myaction, "Rise"
		  
		  // Frame border
		  
		  dim myframe as NSRect = ImageView1.iOSLibView.Frame
		  myframe.Size_.height = myframe.Size_.height - 10
		  myframe.Size_.width = myframe.Size_.width - 10
		  myframe.Origin.x = 5
		  dim border as  iOSLibSKShapeNode = iOSLibSKShapeNode.Rect (myframe)
		  myscene.AddChild border
		  mybody = iOSLibSKPhysicsBody.EdgeLoop (myframe)
		  mybody.CategoryBitMask = BorderCategory
		  mybody.Friction = 1
		  border.PhysicsBody = mybody
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Spaceshooter()
		  if SpaceShooterScene = nil then
		    SpaceShooterScene = new iOSLibSKSceneWithInterface (ImageView1.View.frame.Size_ , ImageView1) // Dim a new Scene the size of the view
<<<<<<< HEAD
		    SpaceShooterScene.name = SpaceShooterName //and give it a name..
		    SpaceShooterScene.BackgroundColor =  new ioslibcolor(&c22222222)
=======
		    SpaceShooterScene.name = "SpaceShooter" //and give it a name..
		    
>>>>>>> I am really sorry – SourceControl brought some interference and after reimporting iOSLib SpriteKit did not want to show anything anymore. So here a re-up with iOSLib bundled – seems to be the best idea for now.
		    // SpaceShooterScene.PhysicsBody = iOSLibSKPhysicsBody. (ImageView1.view.Frame) // add a border in case we will change the movement to MotionManager
		    // SpaceShooterScene.PhysicsBody.CategoryBitMask = 0
		    
		    CreateFighter // Prepare the fighter graphics
		    
		    SpaceShooterScene.ScaleMode = iOSLibSKScene.SKSceneScaleMode.FillProportional // stay in proportions!
		    
		    dim BackGroundnode as new iOSLibSKNode // a new layer for the star background
		    BackGroundnode.Name = SpaceLayerName
		    SpaceShooterScene.AddChild  BackGroundnode // added to the scene
		    
		    SpaceShooterScene.AddChild FighterNormal // add the fighter too
		    Enemy1Texture = new iOSLibSKTexture (Enemy1Name) // prepare the enemy graphics
		    starfall   = iOSLibSKAction.MoveToY (-10, BackgroundSpeedScrollDuration)
		    dim fightershotmove as iOSLibSKAction = iOSLibSKAction.MoveToY (ImageView1.Height + 50, 1)
		    dim soundaction as iOSLibSKAction = iOSLibSKAction.PlaySound ("Standardshoot.mp3", false)
		    FighterShot = iOSLibSKAction.Sequence (soundaction, FighterShotmove)
		    
		    EnemyShot = iOSLibSKAction.movetoy (-50, 2.5)
		    
		    TextureLeftAction = iOSLibSKAction.setTexture ( FighterLeftTexture) // makes the fighter wiggle to the left
		    TextureRightAction = iOSLibSKAction.setTexture ( FighterRightTexture) // and to the right
		    TextureNormalAction = iOSLibSKAction.setTexture ( FighterNormalTexture)
		    CreateEnemy
		    
		  end if
		  
		  ImageView1.ShouldCullNonVisibleNodes = true
		  imageview1.PresentScene SpaceShooterScene
		  
		  // dim myanimation as  iOSLibSKAction = iOSLibSKAction.AnimateWithTextures (bearwalkframes, 0.1)
		  // bear.RunActionWithKey iOSLibSKAction.RepeatAction (myanimation), "WalkingBear"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private BackgroundSpeedScrollDuration As Double = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CanShoot As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Enemy1Texture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EnemyShot As iOSLibSKAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterDamagedTexture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterLeftTexture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterNormal As ioslibskspritenode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterNormalTexture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterReloadTime As Double = 0.15
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterRightTexture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterShot As iOSLibSKAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FighterSpeed As Double = 2.25
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GreenshotTexture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MaxEnemies As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RedshotTexture As iOSLibSKTexture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SpaceShooterScene As iOSLibSKSceneWithInterface
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Starfall As iOSLibSKAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextureLeftAction As iOSLibSKAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextureNormalaction As iOSLibSKAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TextureRightaction As iOSLibSKAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WalkScene As iOSLibSKSceneWithInterface
	#tag EndProperty


	#tag Constant, Name = BackgroundCategory, Type = Double, Dynamic = False, Default = \"32", Scope = Private
	#tag EndConstant

	#tag Constant, Name = BorderCategory, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = BulletCategory, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Enemy1Name, Type = Text, Dynamic = False, Default = \"Enemy1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = EnemyCategory, Type = Double, Dynamic = False, Default = \"16", Scope = Private
	#tag EndConstant

	#tag Constant, Name = EnemyMovingName, Type = Text, Dynamic = False, Default = \"EnemyMoving", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FighterCategory, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FighterMovingName, Type = Text, Dynamic = False, Default = \"FighterMoving", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FighterName, Type = Text, Dynamic = False, Default = \"Fighter", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ObjectCategory, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SpaceLayerName, Type = Text, Dynamic = False, Default = \"SpaceLayer", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SpaceShooterName, Type = Text, Dynamic = False, Default = \"SpaceShooter", Scope = Private
	#tag EndConstant

	#tag Constant, Name = StarFallName, Type = Text, Dynamic = False, Default = \"StarFall", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events ImageView1
	#tag Event
		Sub Open()
		  System.DebugLog "Opened"
		  me.ShowsFPS = true
		  me.ShowsDrawCount = true
		  me.ShowsNodeCount = true
		  me.ShowsFields = true
		  me.ShowsPhysics = true
		  me.ShowsQuadCount = true
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TouchesEnded(Touchset as ioslibset, anEvent as iOSLibEvent)
		  if me.scene.name = SpaceShooterName then ProcessSpaceShooterTouch (Touchset, anEvent)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LayoutSubviews()
		  if WalkScene = nil then ShootWorld
		End Sub
	#tag EndEvent
	#tag Event
		Sub UpdateForScene(time as Double)
		  if me.Scene.name = SpaceShooterName then CreateStar
		End Sub
	#tag EndEvent
	#tag Event
		Sub DidBeginContact(Contact as iOSLibSKPhysicsContact)
		  if ImageView1.Scene.Name = SpaceShooterName then
		    analyzeCollision(contact)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub WillMoveToWindow(window as ptr)
		  if window = nil then
		    me.Scene.RemoveAllActions
		    me.Scene.RemoveAllChildren
		    dim emptyscene as new iOSLibSKSceneWithInterface (me)
		    me.PresentScene  emptyscene
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
